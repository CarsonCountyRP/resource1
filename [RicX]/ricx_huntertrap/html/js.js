$('body').fadeOut(0);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
window.addEventListener('message', function(event) {
  switch (event.data.action) {
    case 'baits':
        var div = $(event.data.html);
        $("body").append(div);
        $('body').fadeIn(0);
        document.addEventListener('keydown', InteractClose);
        $(".select_bait").click(function() {
            var id = $(this).data("id");
            $.post('https://ricx_huntertrap/ricx_huntertrap:select_bait', JSON.stringify({id:id}));
            NoMouse(2)
        });

        break;
    case 'guides':
        var div = $(event.data.html);
        $("body").append(div);
        $('body').fadeIn(0);
        document.addEventListener('keydown', InteractClose);
        break;
    case 'missions':
        var div = $(event.data.html);
        $("body").append(div);
        $("#title_missions").html(event.data.title);
        $("#missions_entries").html(event.data.missions);
        $('body').fadeIn(0);
        document.addEventListener('keydown', InteractClose);
        $(".select_mission").click(function() {
            var id = $(this).data("id");
            var id2 = $(this).data("id2");
            $.post('https://ricx_huntertrap/ricx_huntertrap:select_mission', JSON.stringify({id:id, id2:id2}));
            NoMouse(2)
        });
        break;
    case 'shop':
        var div = $(event.data.html);
        $("body").append(div);
        $("#title_shop").html(event.data.title);
        $('body').fadeIn(0);
        document.addEventListener('keydown', InteractClose);

        $("#btn_sell").click(function() {
            NoMouse(1.0)
            $("#shop_data").html(event.data.data.sell);
            $(".category_entry").click(function() {
                NoMouse(1.0)
                var id = $(this).data("id");
                $("#shop_data").html(event.data.data.sell_sub[id]);
    
                $(".sell_select_item").click(function() {
                    NoMouse(2.5)
                    var id = $(this).data("id");
                    var id2 = $(this).data("id2");
                    $.post('https://ricx_huntertrap/ricx_huntertrap:sell_item', JSON.stringify({id:id, id2:id2}));
                });
            });   
        });
        $("#btn_buy").click(function() {
            NoMouse(1.2)
            $("#shop_data").html(event.data.data.buy);
            $(".buy_select_item").click(function() {
                NoMouse(2.5)
                var id = $(this).data("id");
                $.post('https://ricx_huntertrap/ricx_huntertrap:buy_item', JSON.stringify({id:id}));
            });
        });
        break;
    case 'close':
        InteractClose({key:"Escape"})
        break;
    case 'close2':
        ResetBody();
        break;
    default:
        break;
    }
});
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
function NoMouse(s) {
    $('body').css('pointer-events', 'none');
    setTimeout(function() {
      $('body').css('pointer-events', 'auto');
    }, s * 1000);
}
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
function InteractClose(event) {
    if (event.key === 'Escape' && $('body').is(':visible')) {
        setTimeout(function() {
            ResetBody()
            $.post('https://ricx_huntertrap/ricx_huntertrap:close');  
        }, 0.25 * 1000);
    }
}
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
function ResetBody() {
    $('body').off('keydown.interactClose');
    $('body').html('');
    $('body').fadeOut(0);
}