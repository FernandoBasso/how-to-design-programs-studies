var l = console.log.bind(console);

var answers = document.querySelectorAll('.answer');
var questions = document.querySelectorAll('.question');

answers.forEach(function(item) {
    item.style.display = 'none';
});

questions.forEach(function(item, index) {
    item.addEventListener('click', function() {
        if (answers[index].style.display == 'block') {
            answers[index].style.display = 'none';
        }
        else {
            answers[index].style.display = 'block';
        }
    });
});
