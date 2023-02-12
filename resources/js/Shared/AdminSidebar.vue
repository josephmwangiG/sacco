<template>
  <nav class="iq-sidebar-menu">
    <ul id="iq-sidebar-toggle" class="iq-menu">
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Dashboard</span>
      </li>
      <li>
        <Link href="/dashboard" class="iq-waves-effect"
          ><i class="ri-home-3-line"></i><span>Dashboard</span></Link
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Users</span>
      </li>

      <li>
        <Link
          :href="route('branches.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>Branches</span></Link
        >
      </li>
      <li>
        <Link
          :href="route('members.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-menu-3-line"></i><span>Members</span></Link
        >
      </li>
      <li>
        <Link
          :href="route('leads.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-checkbox-line"></i><span>Leads</span></Link
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Transactions</span>
      </li>
      <li>
        <Link
          :href="route('deposits.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-login-circle-line"></i><span>Deposits</span></Link
        >
      </li>

      <li>
        <Link
          :href="route('withdrawals.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-bar-chart-line"></i><span>Withdrawals</span></Link
        >
      </li>

      <li>
        <Link :href="route('loanTypes.index')" preserve-state
          ><i class="ri-profile-line"></i>Loan Types</Link
        >
      </li>

      <li>
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
          <li>
            <Link :href="route('activeLoans.index')" preserve-state
              ><i class="ri-stack-line"></i>Active Loans</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Applications</Link
            >
          </li>
        </ul>
      </li>

      <li>
        <a href="#" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-database-line"></i><span>Expenses</span></a
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Settings</span>
      </li>
      <li>
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
          <li>
            <Link :href="'/edit'"
              ><i class="ri-pages-line"></i>Organization</Link
            >
          </li>
          <li>
            <Link :href="route('accounts.index')"
              ><i class="ri-question-answer-line"></i>Accounts</Link
            >
          </li>
          <li>
            <a href="#"><i class="ri-invision-line"></i>Capital</a>
          </li>
          <li>
            <Link :href="route('witnessTypes.index')"
              ><i class="ri-archive-line"></i>Witness Types</Link
            >
          </li>

          <li>
            <Link :href="route('loanSettings')"
              ><i class="ri-error-warning-line"></i>Loans Settings</Link
            >
          </li>
          <li>
            <a href="#"><i class="ri-price-tag-line"></i>Payment Methods</a>
          </li>
          <li>
            <a href="#"><i class="ri-mastercard-line"></i>Communication</a>
          </li>
        </ul>
      </li>

      <li>
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
          <li>
            <a href="#"><i class="ri-pages-line"></i>Users</a>
          </li>
          <li>
            <a href="#"><i class="ri-question-answer-line"></i>Roles</a>
          </li>
          <li>
            <a href="#"><i class="ri-invision-line"></i>Permissions</a>
          </li>
        </ul>
      </li>

      <li class="iq-menu-title"><i class=""></i><span>Reports</span></li>
      <li>
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
          <li>
            <a href="#"><i class="ri-login-box-line"></i>Loans</a>
          </li>
          <li>
            <a href="#"><i class="ri-login-box-line"></i>Deposits</a>
          </li>
          <li>
            <a href="#"><i class="ri-login-box-line"></i>Withdrawals</a>
          </li>
          <li>
            <a href="#"><i class="ri-login-circle-line"></i>Expenses</a>
          </li>
          <li>
            <a href="#"><i class="ri-record-mail-line"></i>Leads</a>
          </li>
        </ul>
      </li>
      <div class="py-5"></div>
    </ul>
  </nav>
</template>
