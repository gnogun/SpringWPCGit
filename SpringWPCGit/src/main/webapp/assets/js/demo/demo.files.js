/*
 * Dandelion Admin v2.0 - File Handling Demo JS
 *
 * This file is part of Dandelion Admin, an Admin template build for sale at ThemeForest.
 * For questions, suggestions or support request, please mail me at maimairel@yahoo.com
 *
 * Development Started:
 * March 25, 2012
 * Last Update:
 * December 07, 2012
 *
 */

(function($) {
	$(document).ready(function(e) {
		$("#da-ex-elfinder").elfinder({
			url : 'plugins/elfinder/connectors/php/connector.php', 
			lang : 'en', 
			docked : true, 
			height: 300/*, 
			toolbar : [
				['back', 'reload'], 
				['select', 'open'], 
				['quicklook', 'info', 'rename'], 
				['resize', 'icons', 'list', 'help']
			], 
			contextmenu : {
				// Commands that can be executed for current directory
				cwd : ['reload', 'delim', 'info'], 
				// Commands for only one selected file
				file : ['select', 'open', 'rename'], 
			}*/
		});
		
		$("#da-ex-plupload").pluploadQueue({
			// General settings
			runtimes : 'html4', 
			url : null, 
			max_file_size : '1000mb',
			max_file_count: 20, // user can add no more then 20 files at a time
			chunk_size : '1mb',
			unique_names : true,
			multiple_queues : true
		});
	});
}) (jQuery);