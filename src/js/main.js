$('document').ready(function() {
  $('.pairing-step').hide();

  $('.pair-submit').on('click', function() {
    var userEmail = $('.email-input').val(),
        url;

    if (userEmail !== null && userEmail !== "") {
      url = 'https://mpskill.com:4567/start_pair?email=' + encodeURIComponent(userEmail);
      $.post(url, function(data) {
        $('.pairing-id-1').html(data['pairing_id']);
        $('.pairing-id-2').html(data['pairing_id']);
        $('.pairing-step').show();
        $('.input-step').hide();
      });
    }
  });
});
