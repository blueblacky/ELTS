$(document).ready(function(){
	$('#reader').html5_qrcode(function(data){
	    $('#read').html(data);
	    //	    window.location('http://localhost/rtlx_attendance1.0/admin/'+data);

	    window.location.href = "http://localhost/rtlx_attendance1.0/attendance_entry/" + data;
		},
		function(error){
			$('#read_error').html(error);
		}, function(videoError){
			$('#vid_error').html(videoError);
		}
	);
});
