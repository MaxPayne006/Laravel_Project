// Save Like Or Dislike
$(document).on('click','#saveLikeDislike',function(){
    var _post=$(this).data('post'); 
    var _type=$(this).data('type'); 
    var vm=$(this);  //vm is variable for this
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        url:"/save-likedislike",
        type:"POST",
        dataType:'json',
        data:{
            post:_post,
            type:_type
            // _token:"{{ csrf_token() }}" 
        },
        beforeSend:function(){
            vm.addClass('disabled');
        },
        success:function(res){
            if(res.bool==true){
                vm.removeClass('disabled').addClass('active');
                vm.removeAttr('id');
                var _prevCount=$("."+_type+"-count").text();  
                _prevCount++;
                console.log(_prevCount);
                $("."+_type+"-count").text(_prevCount);  
            }
        }   
    });
});
