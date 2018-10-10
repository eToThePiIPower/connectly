/* eslint no-console: 0 */
/* eslint no-unused-vars: ["error", { "varsIgnorePattern": "app" }] */
/* eslint-disable no-param-reassign, no-underscore-dangle, camelcase */

import Vue from 'vue/dist/vue.esm';
import TurbolinksAdapter from 'vue-turbolinks';
import VueResource from 'vue-resource';

Vue.use(TurbolinksAdapter);
Vue.use(VueResource);

// document.addEventListener('turbolinks:load', () => {
document.addEventListener('DOMContentLoaded', () => {
  const csrf_token = document.querySelector('meta[name="csrf-token"]');
  if (csrf_token != null) {
    Vue.http.headers.common['X-CSRF-Token'] = csrf_token.getAttribute('content');
  }

  const el = document.getElementById('contact_form');

  if (el != null) {
    const contact = JSON.parse(el.dataset.contact);
    const addresses_attributes = JSON.parse(el.dataset.addressesAttributes);
    addresses_attributes.forEach((address) => {
      address._destroy = null;
    });
    contact.addresses_attributes = addresses_attributes;

    const app = new Vue({
      el,
      data() {
        return { contact };
      },
      methods: {
        addAddress() {
          contact.addresses_attributes.push({
            id: null,
            address_type: 'work',
            body: {
              street1: '',
            },
            _destroy: null,
          });
        },
      },
    });
  }
});


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
