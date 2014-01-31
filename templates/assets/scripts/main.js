
// Socket.IO client
$(document).ready(function() {
	var socket = io.connect();

	$('#sender').bind('click', function() {
		socket.emit('message', 'Message sent on ' + new Date()); 
	});

	socket.on('server_message', function(data){
		$('#receiver').append('<blockquote>' + data + '</blockquote>');
	});
});