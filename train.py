# add thư viện
import random
from keras.optimizers import SGD
from keras.layers import Dense, Dropout
from keras.models import load_model
from keras.models import Sequential
import numpy as np
import pickle
import json
import nltk
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()
nltk.download("punkt")
nltk.download("wordnet")


# init file
words = []
classes = []
documents = []
ignore_words = ["?", "!"]
data_file = open("data.json", encoding="utf-8").read()
intents = json.loads(data_file)

# tiền xử lí dữ liệu
for intent in intents["intents"]:
    for pattern in intent["patterns"]:

        # lấy từng từ và mã hóa nó
        w = nltk.word_tokenize(pattern)
        words.extend(w)
        # thêm vào tài liệu
        documents.append((w, intent["tag"]))

        # thêm các lớp vào các danh sách
        if intent["tag"] not in classes:
            classes.append(intent["tag"])
# bổ sung từng từ và xóa các từ trùng lặp khỏi danh sách
# lemmatizer , hạ thấp từng từ và xóa các từ trùng lặp
words = [lemmatizer.lemmatize(w.lower())
         for w in words if w not in ignore_words]
words = sorted(list(set(words)))
# sắp xếp cái lớp
classes = sorted(list(set(classes)))
# documents = sự kết hợp giữa các mẫu và ý định
print(len(documents), "documents")
# classes = ý định
print(len(classes), "classes", classes)
# wrods = tất cả các từ, từ vựng
print(len(words), "unique lemmatized words", words)


pickle.dump(words, open("words.pkl", "wb"))
pickle.dump(classes, open("classes.pkl", "wb"))

# Tạo tập dữ liệu đào tạo và kiểm tra
# khởi tại training
# khởi tạo dữ liệu đào tạo
training = []  # initialization
# tạo một mảng trống cho đầu ra
output_empty = [0] * len(classes)
# traning,túi từ cho mỗi câu
for doc in documents:
    # initializing túi từ
    bag = []
    # danh sách các từ được mã hóa
    pattern_words = doc[0]
    # lemmatize từng từ - tạo từ cơ bản, cố gắng biểu diễn các từ liên quan
    pattern_words = [lemmatizer.lemmatize(
        word.lower()) for word in pattern_words]
    # tạo mảng túi từ với 1, nếu tìm thấy kết hợp từ trong mẫu hiện tại
    for w in words:
        bag.append(1) if w in pattern_words else bag.append(0)

    # đầu ra là '0' cho mỗi thẻ và '1' cho thẻ hiện tại (cho mỗi mẫu)
    output_row = list(output_empty)
    output_row[classes.index(doc[1])] = 1

    training.append([bag, output_row])
# xáo trộn các tính năng và biến thành np.array
random.shuffle(training)
training = np.array(training)
# tạo danh sách đào tạo và kiểm tra. X - mẫu, Y - ý định
train_x = list(training[:, 0])
train_y = list(training[:, 1])
print("Dữ liệu đào tạo đã tạo xong!")

# xây dựng mô hình
# đào tạo thực tế
# Tạo mô hình - 3 lớp. Lớp đầu tiên 128 neurons, lớp thứ hai 64 neurons và lớp đầu ra thứ 3 chứa số lượng neurons
# equal to số lượng ý định để dự đoán mục đích đầu ra với softmax
model = Sequential()
model.add(Dense(128, input_shape=(len(train_x[0]),), activation="relu"))
model.add(Dropout(0.5))
model.add(Dense(64, activation="relu"))
model.add(Dropout(0.5))
model.add(Dense(len(train_y[0]), activation="softmax"))
model.summary()

# biên dịch mô hình. mang lại kết quả tốt cho mô hình
sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)
model.compile(loss="categorical_crossentropy",
              optimizer=sgd, metrics=["accuracy"])

# fitting and saving the model
hist = model.fit(np.array(train_x), np.array(train_y),
                 epochs=200, batch_size=5, verbose=1)
model.save("chatbot_model.h5", hist)
print("model created")
