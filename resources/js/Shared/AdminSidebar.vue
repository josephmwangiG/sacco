<template>
  <nav class="iq-sidebar-menu">
    <ul id="iq-sidebar-toggle" class="iq-menu">
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Dashboard</span>
      </li>
      <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
        <Link href="/dashboard" class="iq-waves-effect"
          ><i class="ri-home-3-line"></i><span>Dashboard</span></Link
        >
      </li>
      <li :class="usePage().url.value.startsWith('/branches') ? 'active' : ''">
        <Link
          :href="route('branches.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>Branches</span></Link
        >
      </li>
      <li :class="usePage().url.value.startsWith('/members') ? 'active' : ''">
        <Link
          :href="route('members.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-menu-3-line"></i><span>Members</span></Link
        >
      </li>
      <li :class="usePage().url.value.startsWith('/leads') ? 'active' : ''">
        <Link
          :href="route('leads.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-checkbox-line"></i><span>Leads</span></Link
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Loans & Savings</span>
      </li>
      <li
        :class="
          usePage().url.value.startsWith('/calculator') ||
          usePage().url.value.startsWith('/activeLoans') ||
          usePage().url.value.startsWith('/loanApplications')
            ? 'active'
            : ''
        "
      >
        <a
          href="#icons"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-list-check"></i><span>Loans</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="icons"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li
            :class="
              usePage().url.value.startsWith('/calculator') ? 'active' : ''
            "
          >
            <Link :href="route('calculator')" preserve-state
              ><i class="ri-calculator-fill"></i>Loans Calculator</Link
            >
          </li>
          <li
            :class="
              usePage().url.value.startsWith('/activeLoans') ? 'active' : ''
            "
          >
            <Link :href="route('activeLoans.index')" preserve-state
              ><i class="ri-stack-line"></i>Active Loans</Link
            >
          </li>
          <li
            :class="
              usePage().url.value.startsWith('/loanApplications')
                ? 'active'
                : ''
            "
          >
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Applications</Link
            >
          </li>
        </ul>
      </li>
      <li :class="usePage().url.value.startsWith('/deposits') ? 'active' : ''">
        <Link
          :href="route('deposits.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-login-circle-line"></i><span>Deposits</span></Link
        >
      </li>

      <li :class="usePage().url.value.startsWith('/dividends') ? 'active' : ''">
        <Link :href="'#'" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-bar-chart-line"></i><span>Dividends</span></Link
        >
      </li>

      <!-- <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
        <a href="#" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-database-line"></i><span>Expenses</span></a
        >
      </li> -->

      <li class="iq-menu-title"><i class=""></i><span>Reports</span></li>
      <li>
        <a
          href="#statements"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-stack-line"></i><span>Statements</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="statements"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <!-- <li>
            <Link :href="route('u.member.statements')" preserve-state
              ><i class="ri-stack-line"></i>Member Statements</Link
            >
          </li> -->
          <!-- <li>
            <Link :href="route('u.savings.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Saving Statements</Link
            >
          </li> -->
          <li>
            <Link :href="route('loans.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loans Statements</Link
            >
          </li>
          <!-- <li>
            <Link :href="route('guarantors.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loan Guarantors</Link
            >
          </li> -->
          <!-- <li>
            <Link :href="route('guarantees.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loans Guaranteed</Link
            >
          </li> -->
        </ul>
      </li>

      <li :class="usePage().url.value.startsWith('/reports') ? 'active' : ''">
        <a
          href="#authentication"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-folder-chart-2-line"></i><span>Reports</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="authentication"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
        <li
            :class="
              usePage().url.value.startsWith('/reports/deposits') ? 'active' : ''
            "
          >
            <Link :href="route('deposits.reports')"><i class="ri-login-circle-line"></i>Deposits</Link>
          </li>
          <!-- <li
            :class="
              usePage().url.value.startsWith('/reports/dividends') ? 'active' : ''
            "
          >
            <Link :href="route('dividends.reports')"><i class="ri-bar-chart-line"></i>Dividends</Link>
          </li>
          <li
            :class="
              usePage().url.value.startsWith('/reports/applications') ? 'active' : ''
            "
          >
            <Link :href="route('applications.reports')"><i class="ri-checkbox-line"></i>Applications</Link>
          </li> -->
          <li
            :class="
              usePage().url.value.startsWith('/reports/loans') ? 'active' : ''
            "
          >
            <Link :href="route('loans.reports')"><i class="ri-stack-line"></i>Loans</Link>
          </li>
          <!-- <li
            :class="
              usePage().url.value.startsWith('/reports/payments') ? 'active' : ''
            "
          >
            <Link :href="route('payments.reports')"><i class="ri-money-pound-circle-line"></i>Payments</Link>
          </li> -->
         
        
          
          <!-- <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
            <a href="#"><i class="ri-login-circle-line"></i>Expenses</a>
          </li> -->
        </ul>
      </li>


      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Settings</span>
      </li>
      <li
        :class="
          usePage().url.value.startsWith('/edit') ||
          usePage().url.value.startsWith('/accounts') ||
          usePage().url.value.startsWith('/witnessTypes') ||
          usePage().url.value.startsWith('/loanTypes') ||
          usePage().url.value.startsWith('/loanSettings')
            ? 'active'
            : ''
        "
      >
        <a
          href="#extra-pages"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-toggle-line"></i><span>Settings</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="extra-pages"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li :class="usePage().url.value.startsWith('/edit') ? 'active' : ''">
            <Link :href="'/edit'"
              ><i class="ri-pages-line"></i>Organization</Link
            >
          </li>
          <li
            :class="usePage().url.value.startsWith('/accounts') ? 'active' : ''"
          >
            <Link :href="route('accounts.index')"
              ><i class="ri-question-answer-line"></i>Accounts</Link
            >
          </li>
          <!-- <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
            <a href="#"><i class="ri-invision-line"></i>Capital</a>
          </li> -->
          <li
            :class="
              usePage().url.value.startsWith('/witnessTypes') ? 'active' : ''
            "
          >
            <Link :href="route('witnessTypes.index')"
              ><i class="ri-archive-line"></i>Witness Types</Link
            >
          </li>

          <li
            :class="
              usePage().url.value.startsWith('/loanTypes') ? 'active' : ''
            "
          >
            <Link :href="route('loanTypes.index')" preserve-state
              ><i class="ri-profile-line"></i>Loan Types</Link
            >
          </li>

          <li
            :class="
              usePage().url.value.startsWith('/loanSettings') ? 'active' : ''
            "
          >
            <Link :href="route('loanSettings')"
              ><i class="ri-error-warning-line"></i>Loans Settings</Link
            >
          </li>
          <!-- <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
            <a href="#"><i class="ri-price-tag-line"></i>Payment Methods</a>
          </li>
          <li :class="usePage().url.value.startsWith('/dashboard') ? 'active' : ''">
            <a href="#"><i class="ri-mastercard-line"></i>Communication</a>
          </li> -->
        </ul>
      </li>

      <li
        :class="
          usePage().url.value.startsWith('/users') ||
          usePage().url.value.startsWith('/roles')
            ? 'active'
            : ''
        "
      >
        <a
          href="#uac"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-pantone-line"></i><span>Users & Permissions</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="uac"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li :class="usePage().url.value.startsWith('/users') ? 'active' : ''">
            <Link :href="route('get-users')"
              ><i class="ri-pages-line"></i>Users</Link
            >
          </li>
          <li :class="usePage().url.value.startsWith('/roles') ? 'active' : ''">
            <Link :href="route('get-roles')"
              ><i class="ri-question-answer-line"></i>Roles</Link
            >
          </li>
        </ul>
      </li>

    
    

      <div class="py-5"></div>
    </ul>
  </nav>
</template>
<script setup>
import { usePage } from "@inertiajs/inertia-vue3";
</script>

