function validate() {
    var Users_name = document.getElementById("submit").getAttribute("data-username");
    var usernameArray = Users_name.split(',');
    var Users_pwd = document.getElementById("submit").getAttribute("data-password");
    var passwordArray = Users_pwd.split(',');
    var username = document.getElementById("username").value;
    var password = document.getElementById("password-field").value;


    for (let i = 0; i < usernameArray.length; i++) {
        if (username == usernameArray[i] && password == passwordArray[i]) {
            xxx = usernameArray[i];
            swal({
                title: "",
                text: "Xin chào",
                icon: "success",
                close: true,
                button: false,
            });
            // Sử dụng Ajax để gửi yêu cầu đến server
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/login", true);
            xhr.setRequestHeader("Content-Type", "application/json");

            // Gửi dữ liệu "xxx" đến server
            xhr.send(JSON.stringify({ data: xxx }));

            // Chuyển hướng sau khi gửi yêu cầu
            xhr.onload = function () {
                if (xhr.status == 200) {
                    window.location.href = "/";
                } else {
                    console.error("Error sending data to server");
                }
            };

            return true;



        }
    }
    //Nếu không nhập gì mà nhấn đăng nhập thì sẽ báo lỗi
    if (username == "" || password == "") {
        swal({
            title: "",
            text: "Bạn chưa điền đầy đủ thông tin đăng nhập...",
            icon: "error",
            close: true,
            button: "Thử lại",
        });

        return false;

    }

    else {
        swal({
            title: "",
            text: "Sai thông tin đăng nhập hãy kiểm tra lại...",
            icon: "error",
            close: true,
            button: "Thử lại",
        });
        return true;
    };
}

//Đặt 1 Admin ảo để đăng nhập quản trị



function RegexEmail(emailInputBox) {
    var emailStr = document.getElementById(emailInputBox).value;
    var emailRegexStr = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var isvalid = emailRegexStr.test(emailStr);
    if (!isvalid) {
        swal({
            title: "",
            text: "Bạn vui lòng nhập đúng định dạng email...",
            icon: "error",
            close: true,
            button: "Thử lại",
        });

        emailInputBox.focus;
    } else {
        swal({
            title: "",
            text: "Chúng tôi vừa gửi cho bạn email hướng dẫn đặt lại mật khẩu vào địa chỉ cho bạn",
            icon: "success",
            close: true,
            button: "Đóng",
        });
        emailInputBox.focus;
        window.location = "#";

    }
}

