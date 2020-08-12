$(function(){

  function build_childSelect() {
    let child_select = `
              <select name="post[category_id]" class="child_category_id">
                <option value="">---</option>
              </select>
              `
    return child_select;
  }
  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `
                      <option value=${children.id}>${children.name}</option>
                      `
    return option_html;
  }

  function build_gcSelect() {
    let gc_select = `
              <select name="post[category_id]" class="gc_category_id">
                <option value="">---</option>
              </select>
              `
    return gc_select;
  }

// 親セレクトを変更したらjQueryが発火する
  $("#category_form").change(function () {
    
    $(this).nextAll(this).remove();
    // 選択した親の値を取得する
    let parentValue = $("#category_form").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        // postsコントローラーにparamsをparent_idで送る
        // dataにparent_idを代入
        data: { parent_id: parentValue },
        dataType: 'json'
      })
      .done(function (data) {
        // selectタグを生成してビューにappendする
        let child_select = build_childSelect
        $("#category_field").append(child_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        data.forEach(function (d) {
          let option_html = build_Option(d)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function () {
        alert("通信エラーです！");
      });
    }
  });

  $(document).on("change", ".child_category_id", function () {

    $(this).nextAll(this).remove();

    // 選択した子の値を取得する
    let childValue = $(".child_category_id").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        // postsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
        .done(function (gc_data) {
          // selectタグを生成してビューにappendする
          let gc_select = build_gcSelect
          $("#category_field").append(gc_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappendする
          gc_data.forEach(function (gc_d) {
            let option_html = build_Option(gc_d);
            $(".gc_category_id").append(option_html);
          });
        })
        .fail(function () {
          alert("gcで通信エラーです！");
        });
    }
  });
})

$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

// 子カテゴリー用のhtmlの作成。子カテゴリーのidはいらないので name=""としています。
  function appendChild(insertHTML) {
    var childSelectHTML = '';
    childSelectHTML = ` <div class="listing-select-wrapper--edit__child">
                          <select class="listing-select-wrapper--edit__child--select" id="child_category_edit" name="">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('#category_field2').append(childSelectHTML);
  }

// 孫カテゴリー用のhtmlを作成。孫カテゴリーのidが欲しいのでname="product[category_id]"としています。
  function appendGrandChild(insertHTML) {
    var grandChildSelect = '';
    grandChildSelect = `<div class="listing-select-wrapper--edit__grandchild">
                          <select class="listing-select-wrapper--edit__grandchild--select" id="grandchild_category_edit" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('#category_field3').append(grandChildSelect);
  }

// 親カテゴリーの値が変わった時の処理を書きます
  $('#parent_category_edit').on('change', function() {
      
// 親カテゴリーのデータを取得して変数にいれる
    var parentCategoryEdit = document.getElementById('parent_category_edit').value;
    if (parentCategoryEdit != '選択してください'){
// ajaxの処理。urlを/products/get_category_childrenにしないとrenderでeditに戻された時に上手く働かない
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        data: { parent_id: parentCategoryEdit },
        dataType: 'json'
      })
// 成功した時の処理
      .done(function(children){
// 元々あった子カテゴリーと孫カテゴリーを消す。
        $('#child_category_edit').remove();
        $('#grandchild_category_edit').remove();
// insertHTMLを定義して中身にオプションをつける。
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
// オプション付きのinsertHTMLをappendChildにいれる。
// 上のappendChildで定義された$('.listing-select-wrapper--edit').append(childSelectHTML);により一番、つまり親カテゴリーのしたに差し込まれる。
        appendChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#child_category_edit').remove();
      $('#grandchild_category_edit').remove();
    }
  });

  // 子カテゴリーとやっていることは基本的に同じです 
  $(this).on('change', '#child_category_edit', function(){
    var childIdEdit = document.getElementById('child_category_edit').value;
    if (childIdEdit !== "---") {
      $.ajax({
        url: '/posts/search',
        type: 'GET',
        data: { children_id: childIdEdit },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $('#grandchild_category_edit').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandChild(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#grandchild_category_edit').remove();
    }
  })
})