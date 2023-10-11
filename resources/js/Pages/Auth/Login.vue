<template>
    <section class="sign-in-page">
        <div class="container bg-white mt-5 p-0">
            <div class="row no-gutters">
                <div class="col-sm-6 align-self-center">
                    <div class="sign-in-from">
                        <h1 class="mb-0 dark-signin">Sign in</h1>
                        <p>
                            Enter your email address and password to access your
                            account.
                        </p>
                        <div
                            class="alert alert-danger"
                            v-if="$page.props.flash.danger"
                        >
                            {{ $page.props.flash.danger }}
                        </div>
                        <div
                            class="alert alert-success"
                            v-if="$page.props.flash.success"
                        >
                            {{ $page.props.flash.success }}
                        </div>
                        <form
                            class="mt-4"
                            @submit.prevent="
                                loginForm.post(route('authenticate'))
                            "
                        >
                            <div class="">{{ success }}</div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"
                                    >Email address</label
                                >
                                <input
                                    type="email"
                                    name="email"
                                    required
                                    class="form-control mb-0"
                                    v-model="loginForm.email"
                                    id="exampleInputEmail1"
                                    placeholder="Enter email"
                                />
                                <div
                                    class="text-danger"
                                    v-if="loginForm.errors.email"
                                >
                                    <small>{{ loginForm.errors.email }}</small>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <Link
                                    :href="route('reset-password')"
                                    class="float-right"
                                    >Forgot password?</Link
                                >
                                <input
                                    type="password"
                                    required
                                    v-model="loginForm.password"
                                    name="password"
                                    class="form-control mb-0"
                                    id="password"
                                    placeholder="Password"
                                />
                            </div>
                            <div class="d-inline-block w-100 mt-3">
                                <div
                                    class="custom-control custom-checkbox d-inline-block mt-2 pt-1"
                                >
                                    <input
                                        type="checkbox"
                                        class="custom-control-input"
                                        id="customCheck1"
                                    />
                                    <label
                                        class="custom-control-label"
                                        for="customCheck1"
                                        >Remember Me</label
                                    >
                                </div>
                                <button
                                    type="submit"
                                    class="btn btn-primary float-right"
                                >
                                    Sign in
                                </button>
                            </div>
                            <div class="sign-info collapse">
                                <span
                                    class="dark-color d-inline-block line-height-2"
                                    >Don't have an account?
                                    <a href="#">Sign up</a></span
                                >
                                <ul class="iq-social-media">
                                    <li>
                                        <a href="#"
                                            ><i class="ri-facebook-box-line"></i
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            ><i class="ri-twitter-line"></i
                                        ></a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            ><i class="ri-instagram-line"></i
                                        ></a>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-6 text-center">
                    <div class="sign-in-detail text-white">
                        <!-- <a class="sign-in-logo mb-5" href="#"
              ><img src="/images/logo-white.png" class="img-fluid" alt="logo"
            /></a> -->
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
import { ref } from "vue";

const loginForm = ref(
    useForm({
        email: "",
        password: "",
    })
);
</script>
