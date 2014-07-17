$( document ).ready(function() {
  $(".tlt").textillate({
    loop: true,
    minDisplayTime: 3000,
    initialDelay: 4,
    in: {effect: 'bounceInDown', shuffle: true},
    out:{effect: 'hinge', shuffle: true},
  });
})

$( document ).ready(function() {
  $(".add").textillate({
    loop: true,
    minDisplayTime: 10,
    initialDelay: 2,
    in: {effect: 'pulse', shuffle: true},
    out: {effect: 'pulse', shuffle: true}
  });
})

$( document ).ready(function() {
  $(".welcome").textillate({
    loop: true,
    minDisplayTime: 100000,
    initialDelay: 2,
    in: {effect: 'fadeInLeft', sequence: true},
    out: {effect: 'fadeOutRight', sequence: true}
  });
})

