$(document).ready(function () {
    const URLGET = "/get"
    $("form").on("submit", function (event) {
        var rawText = $("#text").val();
        var userHtml = '<p class="userText"><span>' + rawText + "</span></p>";
        $("#text").val("");
        $("#chatbox").append(userHtml);
        $.ajax({
            data: {
                msg: rawText,
            },
            type: "POST",
            contentType: "charset=utf-8",
            url: URLGET,
        }).done(function (data) {
            const images = data.images;
            const messages = data.messages;
            let render = '<p class="botText"><span>' + messages + '</span></p>';
            if (data.images.length <= 0) {
                $("#chatbox").append($.parseHTML(render));
            } else {
                $("#chatbox").append($.parseHTML(render));
                data.images.forEach((e) => {
                    $("#chatbox").append($.parseHTML('<img src="' + e + '" alt=""/>'));
                })
            }
            document.getElementById("userInput").scrollIntoView({
                block: "start",
                behavior: "smooth",
            });
        });
        event.preventDefault();
    });
});