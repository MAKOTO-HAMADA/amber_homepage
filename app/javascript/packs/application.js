// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
//import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 
import "./jquery.jpostal.js"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

$(function() {
    $('#customer_postal_code').jpostal({
      postcode : [
        '#customer_postal_code'
      ],
      address: {
        "#customer_prefecture_code": "%3", // # 都道府県が入力される
        "#customer_city"           : "%4%5", // # 市区町村と町域が入力される
        "#customer_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
});
// # 入力項目フォーマット
// #   %3  都道府県
// #   %4  市区町村
// #   %5  町域
// #   %6  大口事業所の番地 ex)100-6080
// #   %7  大口事業所の名称