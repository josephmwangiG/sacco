<template>
    <section class="sign-in-page">
        <div class="container mt-5 p-0 bg-white">
            <div class="row no-gutters">
                <div class="col-sm-6 align-self-center">
                    <div class="sign-in-from">
                        <h1 class="mb-0">Reset Password</h1>
                        <p>
                            Enter your email address and we'll send you an email
                            with instructions to reset your password.
                        </p>
                        <div
                            class="alert alert-success"
                            v-if="$page.props.flash.success"
                        >
                            {{ $page.props.flash.success }}
                        </div>
                        <form class="mt-4" @submit.prevent="submit">
                            <div class="form-group">
                                <label for="exampleInputEmail1"
                                    >Email address</label
                                >
                                <input
                                    type="email"
                                    v-model="form.email"
                                    class="form-control mb-0"
                                    id="exampleInputEmail1"
                                    placeholder="Enter email"
                                />
                                <div
                                    class="text-danger"
                                    v-if="form.errors.email"
                                >
                                    <small>{{ form.errors.email }}</small>
                                </div>
                            </div>

                            <div class="d-inline-block w-100 mt-3">
                                <span
                                    class="dark-color d-inline-block line-height-2"
                                    >Go back to?
                                    <Link :href="route('login')"
                                        >Login</Link
                                    ></span
                                >
                                <button
                                    type="submit"
                                    class="btn btn-primary float-right"
                                >
                                    Reset Password
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-sm-6 text-center">
                    <div class="sign-in-detail text-white">
                        <a class="sign-in-logo mb-5" href="#"
                            ><img
                                src="/images/logo-white.png"
                                class="img-fluid"
                                alt="logo"
                        /></a>
                        <div class="slick-slider11">
                            <div class="item">
                                <img
                                    src="/images/login/1.png"
                                    class="img-fluid mb-4"
                                    alt="logo"
                                />
                                <h4 class="mb-1 text-white">
                                    PSC Sacco
                                </h4>
                                <p>
                                    Easily manage your Loans applications,
                                    transactions and savings.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<script setup>
import { useForm } from "@inertiajs/inertia-vue3";

const form = useForm({
    email: "",
});

const submit = () => {
    form.post(route("update-password"));
};
</script>
