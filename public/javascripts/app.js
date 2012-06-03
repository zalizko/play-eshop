$(document).ready(function() {

	var slideBlockDuration = 300;

	$('#overlay, #spinner').hide().ajaxStart(function() {
		$(this).show();
	}).ajaxStop(function() {
		$(this).hide();
	});

	function updateBasketTotalTaken(increment) {
		$('.basketTotalTaken').fadeTo("fast", 0.1, function() {
			var value = $('.basketTotalTaken').text();
			$('.basketTotalTaken').text(1 * value + 1 * increment)
			$(this).fadeTo("fast", 1);
		});
	}

	$('a.quantity_less').click(function() {
		var quantityEl = $(this).next('.quantity');
		var c = quantityEl.text();
		if (c <= 0)
			return false;
		var url = $(this).attr('href');
		$.ajax({
			url : url,
			success : function() {
				updateBasketTotalTaken(-1);
				quantityEl.text(--c);
			}
		});

		return false;
	});

	$('a.quantity_more').click(function() {
		var quantityEl = $(this).prev('.quantity');
		var c = quantityEl.text();
		if (c >= 8)
			return false;
		var url = $(this).attr('href');
		$.ajax({
			url : url,
			success : function() {
				updateBasketTotalTaken(1);
				quantityEl.text(++c);
			}
		});

		return false;
	});

	$('#header .search').on('click', function() {
		$('#search').slideToggle(slideBlockDuration);
		return false;
	});

	$('.slideBlock').each(function() {
		var block = $(this);

		$('a[href="#close"]', block).on('click', function() {
			block.slideToggle(slideBlockDuration);
			return false;
		});

		$('form', block).ajaxForm({
			target : '#content',
			success : function(data) {
				$('#content').toggle(slideBlockDuration);
			}
		});

		$('a[href="#submit"]', block).on('click', function() {
			(function(a, block) {
				block.slideToggle(slideBlockDuration);
				var do_toggle_content = function() {
					$('#content').toggle(300);
					var do_submit = function() {
						$('#content').empty();
						a.closest('form').submit();
					}
					setTimeout(do_submit, 300);
				}
				setTimeout(do_toggle_content, slideBlockDuration);
			})($(this), block);

			return false;
		});
	});

	$('.datepicker').datepicker({
		theme : 'simple',
		lang : 'en'
	});

});