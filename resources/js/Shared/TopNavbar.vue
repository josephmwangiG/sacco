<template>
    <div class="iq-top-navbar">
        <div class="iq-navbar-custom">
            <div class="iq-sidebar-logo">
                <div class="top-logo">
                    <a href="/" class="logo">
                        <div class="iq-light-logo">
                            <img
                                src="/images/logo.gif"
                                class="img-fluid"
                                alt=""
                            />
                        </div>
                        <div class="iq-dark-logo">
                            <img
                                src="/images/logo-dark.gif"
                                class="img-fluid"
                                alt=""
                            />
                        </div>
                        <span>vito</span>
                    </a>
                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light p-0">
                <div class="navbar-left">
                    <ul
                        id="topbar-data-icon"
                        class="d-flex p-0 topbar-menu-icon"
                    >
                        <!-- <li>
                            <Link
                                :href="router('u.index')"
                                class="nav-link router-link-exact-active router-link-active"
                                ><i class="ri-home-4-line"></i
                            ></Link>
                        </li> -->

                        <li>
                            <Link
                                :href="route('u.index')"
                                class="nav-link router-link-exact-active router-link-active"
                                ><i class="ri-home-4-line"></i
                            ></Link>
                        </li>

                        <!-- <li>
                            <Link
                                :href="route('member.statements')"
                                class="nav-link router-link-exact-active router-link-active"
                                ><i class="ri-file-list-line"></i
                            ></Link>
                        </li> -->

                        <!-- <li>
                            <a href="#" class="nav-link"
                                ><i class="ri-question-answer-line"></i
                            ></a>
                        </li> -->
                        <li>
                            <Link
                                :href="route('calculator')"
                                class="nav-link router-link-exact-active router-link-active"
                                ><i class="ri-calculator-fill"></i
                            ></Link>
                        </li>
                        <!-- <li>
                            <a href="#" class="nav-link"
                                ><i class="ri-inbox-line"></i
                            ></a>
                        </li> -->
                    </ul>
                    <div class="iq-search-bar d-none d-md-block">
                        <form action="#" class="searchbox">
                            <input
                                type="text"
                                class="text search-input"
                                placeholder="Type here to search..."
                            />
                            <a class="search-link" href="#"
                                ><i class="ri-search-line"></i
                            ></a>
                            <div class="searchbox-datalink">
                                <h6 class="pl-3 pt-3 pb-3">Pages</h6>
                                <ul class="m-0 pl-3 pr-3 pb-3">
                                    <li class="iq-bg-primary-hover rounded">
                                        <a
                                            href="/"
                                            class="nav-link router-link-exact-active router-link-active pr-2"
                                            ><i class="ri-home-4-line pr-2"></i
                                            >Dashboard</a
                                        >
                                    </li>
                                    <!-- <li class="iq-bg-primary-hover rounded">
                                        <Link href="#" class="nav-link"
                                            ><i
                                                class="ri-calendar-2-line pr-2"
                                            ></i
                                            >Calendar</Link
                                        >
                                    </li> -->
                                    <li class="iq-bg-primary-hover rounded">
                                        <Link href="/profile" class="nav-link"
                                            ><i class="ri-profile-line pr-2"></i
                                            >Profile</Link
                                        >
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-label="Toggle navigation"
                >
                    <i class="ri-menu-3-line"></i>
                </button>
                <div class="iq-menu-bt align-self-center">
                    <div class="wrapper-menu">
                        <div class="main-circle">
                            <i class="ri-arrow-left-s-line"></i>
                        </div>
                        <div class="hover-circle">
                            <i class="ri-arrow-right-s-line"></i>
                        </div>
                    </div>
                </div>
                <div
                    class="collapse navbar-collapse"
                    id="navbarSupportedContent"
                >
                    <ul class="navbar-nav ml-auto navbar-list">
                        <li class="nav-item">
                            <a href="#" class="search-toggle iq-waves-effect">
                                <i class="ri-notification-line"></i>
                                <span class="bg-danger dots"></span>
                            </a>
                            <div class="iq-sub-dropdown">
                                <div class="iq-card shadow-none m-0">
                                    <div class="iq-card-body p-0">
                                        <div class="bg-primary p-3">
                                            <h5 class="mb-0 text-white">
                                                All Notifications<small
                                                    class="badge badge-light float-right pt-1"
                                                    >1</small
                                                >
                                            </h5>
                                        </div>
                                        <a href="#" class="iq-sub-card">
                                            <div
                                                class="media align-items-center"
                                            >
                                                <div class="">
                                                    <img
                                                        class="avatar-40 rounded"
                                                        src="/images/user/01.jpg"
                                                        alt=""
                                                    />
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0">Admin</h6>
                                                    <small
                                                        class="float-right font-size-12"
                                                        >Just Now</small
                                                    >
                                                    <p class="mb-0">95 MB</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="search-toggle iq-waves-effect">
                                <i class="ri-message-line"></i>
                                <span class="bg-primary count-mail"></span>
                            </a>
                            <div class="iq-sub-dropdown">
                                <div class="iq-card shadow-none m-0">
                                    <div class="iq-card-body p-0">
                                        <div class="bg-primary p-3">
                                            <h5 class="mb-0 text-white">
                                                All Messages<small
                                                    class="badge badge-light float-right pt-1"
                                                    >1</small
                                                >
                                            </h5>
                                        </div>
                                        <a href="#" class="iq-sub-card">
                                            <div
                                                class="media align-items-center"
                                            >
                                                <div class="">
                                                    <img
                                                        class="avatar-40 rounded"
                                                        src="/images/user/01.jpg"
                                                        alt=""
                                                    />
                                                </div>
                                                <div class="media-body ml-3">
                                                    <h6 class="mb-0">Admin</h6>
                                                    <small
                                                        class="float-left font-size-12"
                                                        >13 Jun</small
                                                    >
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <ul class="navbar-list">
                    <li>
                        <a
                            href="#"
                            class="search-toggle iq-waves-effect d-flex align-items-center bg-primary rounded"
                        >
                            <img
                                src="/images/user/1.jpg"
                                class="img-fluid rounded mr-3"
                                alt="user"
                            />
                            <div class="caption">
                                <h6 class="mb-0 line-height text-white">
                                    {{ user.first_name }}
                                </h6>
                                <span class="font-size-12 text-white"
                                    >Available</span
                                >
                            </div>
                        </a>
                        <div class="iq-sub-dropdown iq-user-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white line-height">
                                            {{ user.first }}
                                        </h5>
                                        <span class="text-white font-size-12"
                                            >Available</span
                                        >
                                    </div>
                                    <Link
                                        :href="'/edit'"
                                        class="iq-sub-card iq-bg-primary-hover"
                                    >
                                        <div class="media align-items-center">
                                            <div
                                                class="rounded iq-card-icon iq-bg-primary"
                                            >
                                                <i
                                                    class="ri-file-user-line"
                                                ></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0">My Profile</h6>
                                                <p class="mb-0 font-size-12">
                                                    View personal profile
                                                    details.
                                                </p>
                                            </div>
                                        </div>
                                    </Link>
                                    <Link
                                        :href="'/edit'"
                                        class="iq-sub-card iq-bg-primary-hover"
                                    >
                                        <div class="media align-items-center">
                                            <div
                                                class="rounded iq-card-icon iq-bg-primary"
                                            >
                                                <i class="ri-profile-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0">
                                                    Edit Profile
                                                </h6>
                                                <p class="mb-0 font-size-12">
                                                    Modify your personal
                                                    details.
                                                </p>
                                            </div>
                                        </div>
                                    </Link>
                                    <!-- <a
                                        href="#"
                                        class="iq-sub-card iq-bg-primary-hover"
                                    >
                                        <div class="media align-items-center">
                                            <div
                                                class="rounded iq-card-icon iq-bg-primary"
                                            >
                                                <i
                                                    class="ri-account-box-line"
                                                ></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0">
                                                    Account settings
                                                </h6>
                                                <p class="mb-0 font-size-12">
                                                    Manage your account
                                                    parameters.
                                                </p>
                                            </div>
                                        </div>
                                    </a> -->
                                    <!-- <a
                                        href="#"
                                        class="iq-sub-card iq-bg-primary-hover"
                                    >
                                        <div class="media align-items-center">
                                            <div
                                                class="rounded iq-card-icon iq-bg-primary"
                                            >
                                                <i class="ri-lock-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0">
                                                    Privacy Settings
                                                </h6>
                                                <p class="mb-0 font-size-12">
                                                    Control your privacy
                                                    parameters.
                                                </p>
                                            </div>
                                        </div>
                                    </a> -->
                                    <div
                                        class="d-inline-block w-100 text-center p-3"
                                    >
                                        <Link
                                            href="/logout"
                                            method="post"
                                            as="button"
                                            class="btn btn-primary dark-btn-primary"
                                        >
                                            Sign out<i
                                                class="ri-login-box-line ml-2"
                                            ></i>
                                        </Link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</template>

<script setup>
import { usePage } from "@inertiajs/inertia-vue3";
const user = usePage().props.value.user;
</script>
