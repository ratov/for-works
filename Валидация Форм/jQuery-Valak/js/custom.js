$(function() {

	$("#js-register-form").validate({
		rules: {
			form_name: {
				required: true, //Обязательно для заполнения
			},
			form_email: {
				required: true,
				email: true
			},
			form_tel: {
				required: true,
				digits: true, //Валидирует инпут с телефоном. Чтобы были цифры
			},
			form_pswd1: {
				required: true,
				minlength: 6
			},
			form_pswd2: {
				required: true,
				minlength: 6,
				equalTo: "#form-pswd1" //equalTo - сравнивает пароль с id="form-pswd1"
			}
		},

		messages: {
			form_name: {
				required: "Поле Имя обязательно для заполнения" //Сообщение выскакивает если в поле не чего не вводить
			},
			form_email: {
				required: "Поле E-mail обязательное для заполнения",
				email: "Введите пожалуйста корректный e-mail"
			}
		},
		focusCleanup: true, //Если в полях высвечиваются ошибки, то при фокусе(курсор ставим на инпут) ошибки очищаются
		focusInvalid: false, //Полезная опция, не помешает поставить
		invalidHandler: function(event, validator) { //Сверху появится блок с предупреждением про ошибки
			$(".js-form-message").text("Исправте пожалуйста все ошибки");
		},
		onkeyup: function(element) { //При исправлении ошибки блок(который указан выше) исчезает
			$(".js-form-message").text("");
		},
		errorPlacement: function(error, element) { //Вся не валидность над инпутами исчезает, и остается один блок с предупреждением о невалидности
			return true;
		},
		errorClass: "form-input_error", //Меняет клас по умолчанию error на тот который введем в ковычках "form-input_error"
		validClass: "form-input_valid"
	});

});
