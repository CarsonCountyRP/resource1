let type;
let pic;
const randomColor = () => {
    const r = Math.floor(Math.random()*255);
    const g = Math.floor(Math.random()*255);
    const b = Math.floor(Math.random()*255);
    return 'rgb(' + r + ',' + g +',' + b + ')'
}

const randomX = () =>{
    // minus balloon width to make sure balloon always within viewport
    let left = Math.floor(Math.random() * $(window).innerWidth() - 100)
    if ( left < 0){
        left = 0
    }
    return `${left}px`
}

// move balloon at random speed
const randomSpeed = () => {
    let speed = Math.floor(Math.random() * 6)    
    if (speed < 3){
        return 3000
    }
    return speed * 2000
}

// when game start, create new balloon every second
const startGame = () => {
    let second = 30
    $("#start").hide()
    let timer = setInterval(function() {
        $("#timer").text(second);;
        if (second === 0){
            clearInterval(timer)
            $("body").hide();  
            let score = $("#score").text()
            $.post('http://syn_ranch/send', JSON.stringify({score:score}));
            $("#container").html("")
            $("#score").text(0)
            $("#restart").hide()
            
        } else {
            createBalloon()
            second--
        }
    }, 1000);
};

$('#container').on('click', '.balloon', function(e) {
    e.stopPropagation(); // Add this line to stop the event from bubbling up
    $(e.target).remove();
    $('#score').text(parseInt($('#score').text()) + 1);
});

const createBalloon = () => {
    let newBalloon = document.createElement('div')
    $(newBalloon).addClass('balloon')
    $(newBalloon).html(`
        <span class="top-c"></span>
        <span class="left-c"></span>
    `)
    
    if (pic == "racking") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background: "url('hay.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "hayscope") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('poop.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "feed") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('feed.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "hayspread") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('hayspread.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "water") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('water.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "milk") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('milk.png')", backgroundSize: "100% 100%" }) 
    } else if  (pic == "eggs") {
    $(newBalloon).css({bottom: '-130px', left: randomX(),background:"url('eggs.png')", backgroundSize: "100% 100%" }) 
    }

    $(newBalloon).animate({bottom:'110vh'}, randomSpeed())
    $('#container').append(newBalloon)
}

const restart = () => {
    $("body").hide();  
    let score = $("#score").text()
    $.post('http://syn_ranch/send', JSON.stringify({score:score}));
    $("#container").html("")
    $("#score").text(0)
    $("#restart").hide()
    
};


$(document).ready(function(){
  
    $("body").hide();    

    window.addEventListener('message', function(event){
        let data = event.data;
        type=data.action;
        pic = data.pic;
        if (data.action == "show") {
            $("body").fadeIn(1000);
            startGame()
        }
    });
});