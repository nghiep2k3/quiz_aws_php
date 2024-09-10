document.addEventListener("DOMContentLoaded", function () {
    const apiUrl = "http://localhost:8081/rest_api/api/question/read.php";
    const questionsContainer = document.getElementById("questions");
    const nextBtn = document.getElementById("next-btn");
    const retryBtn = document.getElementById("retry-btn");

    let currentQuestionIndex = 0;
    let questions = [];
    let score = 0;

    fetch(apiUrl)
        .then((response) => response.json())
        .then((data) => {
            questions = data.data;
            if (questions && questions.length > 0) {
                displayQuestion(currentQuestionIndex);
            } else {
                questionsContainer.innerHTML = "<p>Không có câu hỏi nào.</p>";
            }
        })
        .catch((error) => {
            console.error("Error fetching data:", error);
            questionsContainer.innerHTML = "<p>Lỗi khi tải dữ liệu.</p>";
        });

    function displayQuestion(index) {
        const question = questions[index];
        questionsContainer.innerHTML = `
            <div class="question">
                <div class="question-title">${question.title}</div>
                <ul class="options">
                    <li data-option="a">A. ${question.cau_a}</li>
                    <li data-option="b">B .${question.cau_b}</li>
                    <li data-option="c">C. ${question.cau_c}</li>
                    <li data-option="d">D. ${question.cau_d}</li>
                    <li data-option="d">Đáp án đúng: ${question.cau_dung}</li>
                </ul>
            </div>
        `;

        document.querySelectorAll(".options li").forEach((option) => {
            option.addEventListener("click", function () {
                document.querySelectorAll(".options li").forEach((opt) => {
                    opt.classList.remove("selected");
                });
                option.classList.add("selected");
            });
        });

        nextBtn.disabled = true;

        document.querySelector(".options").addEventListener("click", () => {
            if (document.querySelector(".options li.selected")) {
                nextBtn.disabled = false;
            }
        });
    }

    nextBtn.addEventListener("click", function () {
        const selectedOption = document.querySelector(".options li.selected");
        if (selectedOption) {
            const selectedAnswer = selectedOption.getAttribute("data-option");
            const correctAnswer = questions[currentQuestionIndex].cau_dung;
            console.log(2222, questions);
            console.log(2222, questions?.[0]?.cau_dung);
            
    
            // So sánh trực tiếp giá trị của selectedAnswer và correctAnswer
            if (selectedAnswer == correctAnswer) {
                score++;
            }
    
            if (currentQuestionIndex < questions.length - 1) {
                console.log("điểm", score);
                console.log(selectedAnswer, correctAnswer);
                
                currentQuestionIndex++;
                displayQuestion(currentQuestionIndex);
                nextBtn.disabled = true;
            } else {
                displayScore();
            }
        }
    });
    

    retryBtn.addEventListener("click", function () {
        currentQuestionIndex = 0;
        score = 0;
        displayQuestion(currentQuestionIndex);
        nextBtn.style.display = "block";
        retryBtn.style.display = "none";
    });

    function displayScore() {
        questionsContainer.innerHTML = `
            <p>Bạn đã hoàn thành tất cả các câu hỏi!</p>
            <p>Điểm của bạn: ${score} / ${questions.length}</p>
        `;
        nextBtn.style.display = "none";
        retryBtn.style.display = "block";
    }
});
