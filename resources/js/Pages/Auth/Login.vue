<template>
    <section class="sign-in-page bg-white mt-0">
        <div class="container bg-white px-0 py-5 d-flex align-items-center" >
            <div class="row no-gutters py-5 shadow-sm w-100" style="background-color: #f5f5f5; min-height: 90vh !important; border-radius: 8px;">
             
                <div class="col-md-4 offset-md-1 align-self-center hide-on-small">
                    <div class="">
                      
                        <div class="slick-slider1">
                            <div class="item px-4">
                                <img
                                    src="/images/login/banner.jpeg"
                                    class="mb-4 w-100"
                                    alt="logo"
                                />
                                <h4 class="mb-1 text-white bg-primary p-2 text-center" >
                                    Automate your SACCO
                                </h4>
                                <p class="text-primary mt-3" >
                                    PSC Sacco is what your SACCO needs to move to the next level. Focus on Investments as we handle the Financial Administration. Automate your SACCO now!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 offset-md-1 col-12 align-self-center login-section">
                    <div class="sign-in-from">
                        <h3 class="mb-0 dark-signin mb-2">Login to PSC SACCO</h3>
                        <strong>
                            Welcome back! Please enter your details.
                        </strong>
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
                                    class="custom-control custom-checkbox d-inline-block mt-2 pt-1 my-auto"
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
                                <Link
                                    :href="route('reset-password')"
                                    class="my-auto float-right"
                                    >Forgot password?</Link
                                >
                            </div>
                            <button
                                    type="submit"
                                    style="border-radius: 4px;"
                                    class="btn btn-primary w-100 mt-3"
                                >
                                   <strong> Sign in</strong>
                                </button>
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

<style>
@media (max-width: 768px) { /* Adjust the max-width value to match your 'md' breakpoint */
  .hide-on-small {
    display: none;
  }
  .login-section{
    width: 100% !important;
  }
}
</style>