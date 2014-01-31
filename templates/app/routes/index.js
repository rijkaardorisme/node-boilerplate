
/*
 * GET index
 */

exports.index = function(req, res){
	res.render('app/index', {
		locals: {
			title: 'Home'
		,	description: ''
		,	author: ''
		,	analyticssiteid: 'XXXXXXX'
		}
	});
};