import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './assets/styles/sidebar.css'
import './assets/styles/productcard.css'

const app = createApp(App)
app.use(store)
app.use(router)
app.mount('#app')
