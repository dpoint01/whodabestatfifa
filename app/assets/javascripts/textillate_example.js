$( document ).ready(function() {
  $(".tlt").textillate({
    loop: true,
    minDisplayTime: 3000,
    initialDelay: 4,
    in: {effect: 'bounceInDown', shuffle: true},
    out:{effect: 'hinge', shuffle: true},
  });
})
