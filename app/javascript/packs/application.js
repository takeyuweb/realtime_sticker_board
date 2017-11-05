/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'rails-ujs';
import Turbolinks from 'turbolinks';
import * as mdc from 'material-components-web';
import '../styles';

let app = {};
const modules = require.context("../app/", true, /^\.\/.*\.js$/);
modules.keys().forEach(key => {
  let name = key.split('/').pop().split('.').shift()
  app[name] = modules(key).default
});

document.addEventListener('turbolinks:load', () => {
  mdc.autoInit();

  const module = app[document.body.dataset.controller]
  if (module) {
    module();
  }
});

Turbolinks.start();
