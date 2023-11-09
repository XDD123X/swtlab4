// notibox.js

function showNotification(message) {
    var notificationBox = document.createElement("div");
    notificationBox.classList.add("notification-box");
    var notificationContent = document.createElement("div");
    notificationContent.classList.add("notification-content");
    var notificationMessage = document.createElement("span");
    notificationMessage.classList.add("notification-message");
    notificationMessage.innerText = message;
    var closeButton = document.createElement("button");
    closeButton.classList.add("close-button");
    closeButton.innerText = "X";
    closeButton.addEventListener("click", closeNotification);

    notificationContent.appendChild(notificationMessage);
    notificationContent.appendChild(closeButton);
    notificationBox.appendChild(notificationContent);
    document.body.appendChild(notificationBox);
}

function closeNotification() {
    var notificationBox = document.querySelector(".notification-box");
    if (notificationBox) {
        notificationBox.remove();
    }
}
