import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/inertia-vue3";
import { InertiaProgress } from "@inertiajs/progress";
import Sidebar from "./Shared/Sidebar.vue";
import Footer from "./Shared/Footer.vue";
import Confirm from "./Shared/Confirm.vue";
import FormGroup from "./Shared/FormGroup.vue";
import TopNavbar from "./Shared/TopNavbar.vue";
import Main from "./Pages/Layouts/Main.vue";
import { Link } from "@inertiajs/inertia-vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";

InertiaProgress.init();

createInertiaApp({
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.vue`,
            import.meta.glob("./Pages/**/*.vue")
        ),
    setup({ el, App, props, plugin }) {
        const app = createApp({ render: () => h(App, props) })
            .use(plugin)
            .mixin({
                components: {
                    Sidebar,
                    TopNavbar,
                    Footer,
                    Link,
                    Main,
                    Confirm,
                    FormGroup,
                },
                methods: { route: window.route },
            })
            .mount(el);
    },
});
