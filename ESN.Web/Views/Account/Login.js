(function () {

    $(function () {
        var $loginForm = $('#LoginForm');

        $loginForm.submit(function (e) {
            e.preventDefault();

            if (!$loginForm.valid()) {
                return;
            }

            abp.ui.setBusy(
                $('#LoginArea'),

                abp.ajax({
                    contentType: 'application/x-www-form-urlencoded',
                    url: $loginForm.attr('action'),
                    data: $loginForm.serialize(),
                    success: function (d) {
                        if(!d) {
                            abp.notify.error('Invalid username or password!');
                        }
                    },
                })
            );
        });

        var $forgotForm = $('#ForgotPasswordForm');

        $forgotForm.submit(function (e) {
            e.preventDefault();

            if (!$forgotForm.valid()) {
                return;
            }

            abp.ui.setBusy(
                $('#LoginArea'),

                abp.ajax({
                    contentType: 'application/x-www-form-urlencoded',
                    url: $forgotForm.attr('action'),
                    data: $forgotForm.serialize(),
                    success: function (d) {
                        if(d.success) {
                            location.href = "/account/ResetPasswordResult"
                        } else {
                            abp.notify.error(d.message);
                        }
                    },
                })
            );
        });

        $('a.social-login-link').click(function () {
            var $a = $(this);
            var $form = $a.closest('form');
            $form.find('input[name=provider]').val($a.attr('data-provider'));
            $form.submit();
        });

        $('input[name=returnUrlHash]').val(location.hash);

        $('#LoginForm input:first-child').focus();
    });

})();