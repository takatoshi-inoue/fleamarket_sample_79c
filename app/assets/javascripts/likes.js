$(function(){
  $("#color").click(function () {
    // const postId = $(this).
    const postId = 17;
    $.ajax({
      url: `/posts/${postId}/likes/`,
      type: 'GET',
      data: {},
      dataType: 'json'
    })
    .done(function (data) {
      console.log(data);
      const like_counter;

    })
    .fail(function () {
      alert("通信エラーです！");
    });
  });
});