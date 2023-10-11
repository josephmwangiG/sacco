<template>
    <section class="sign-in-page">
        <div class="container mt-5 p-0 bg-white">
            <div class="row no-gutters">
                <div class="col-sm-6 align-self-center">
                    <div class="sign-in-from">
                        <h1 class="mt-3 mb-0">Success !</h1>
                        <p>
                            A email has been send to <strong>{{email}}</strong>.
                            Please check your email and click on
                            the included link to reset your password.
                        </p>
                        <div class="d-inline-block w-100">
                            <Link :href="route('login')" type="submit" class="btn btn-primary mt-3">
                                Back to Login
                            </Link>
                        </div>
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
defineProps({ email: String });
</script>
