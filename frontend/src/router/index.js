import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        requiresAuth: false,
        title: "Home / Számlázó",
      },
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
      meta: {
        requiresAuth: false,
        title: "About / Számlázó",
      },
    },
    {
      path: "/kategoriak",
      name: "kategoriak",
      component: () => import("../views/KategoriakView.vue"),
      meta: {
        requiresAuth: true,
        title: "Kategóriák / Számlázó",
      },
    },
    {
      path: "/termekek",
      name: "termekek",
      component: () => import("../views/TermekekView.vue"),
      meta: {
        requiresAuth: true,
        title: "Login / Számlázó",
      },
    },
    {
      path: "/fuvarBevitel",
      name: "fuvarBevitel",
      component: () => import("../views/FuvarBevitel.vue"),
      meta: {
        requiresAuth: true,
        title: "Számla kiállító / Számlázó",
      },
    },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      meta: {
        requiresAuth: false,
        title: "Login / Számlázó",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      name: "PageNotFound",
      component: () => import("../views/404View.vue"),
      meta: {
        requiresAuth: false,
        title: "404 / Számlázó",
      },
    },
  ],
});

export default router;
