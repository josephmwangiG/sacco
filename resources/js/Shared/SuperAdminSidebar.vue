<template>
  <nav class="iq-sidebar-menu">
    <ul id="iq-sidebar-toggle" class="iq-menu">
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Dashboard</span>
      </li>
      <li>
        <Link href="/s-admin/dashboard" class="iq-waves-effect"
          ><i class="ri-home-3-line"></i><span>Dashboard</span></Link
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Users</span>
      </li>

      <li>
        <Link
          :href="route('organizations.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>Organizations</span></Link
        >
      </li>
      <li>
        <Link href="/todo" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-menu-3-line"></i><span>Members</span></Link
        >
      </li>
      <li>
        <Link href="/todo" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-checkbox-line"></i><span>Leads</span></Link
        >
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Transactions</span>
      </li>
      <li>
        <Link href="/todo" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-login-circle-line"></i><span>Deposits</span></Link
        >
      </li>

      <li>
        <Link href="/todo" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-bar-chart-line"></i><span>Withdrawals</span></Link
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
            <Link href="/dripicons" preserve-state
              ><i class="ri-stack-line"></i>Active Loans</Link
            >
          </li>
          <li>
            <Link href="/fontawesome" preserve-state
              ><i class="ri-checkbox-line"></i>Applications</Link
            >
          </li>
          <li>
            <Link href="/line" preserve-state
              ><i class="ri-profile-line"></i>Loan Types</Link
            >
          </li>
          <li>
            <Link href="/remixicon" preserve-state
              ><i class="ri-remixicon-line"></i>Remixicon</Link
            >
          </li>
          <li>
            <Link href="/unicons" preserve-state
              ><i class="ri-underline"></i>unicons</Link
            >
          </li>
        </ul>
      </li>

      <li>
        <Link href="/todo" class="iq-waves-effect" aria-expanded="false"
          ><i class="ri-database-line"></i><span>Expenses</span></Link
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
            <Link href="/organization"
              ><i class="ri-pages-line"></i>Organization</Link
            >
          </li>
          <li>
            <Link href="/invoice"
              ><i class="ri-question-answer-line"></i>Accounts</Link
            >
          </li>
          <li>
            <Link href="/blank"><i class="ri-invision-line"></i>Capital</Link>
          </li>
          <li>
            <Link href="/error"
              ><i class="ri-archive-line"></i>Borrowers Settings</Link
            >
          </li>
          <li>
            <Link href="/error-500"
              ><i class="ri-error-warning-line"></i>Loans Settings</Link
            >
          </li>
          <li>
            <Link href="/pricing"
              ><i class="ri-price-tag-line"></i>Payment Methods</Link
            >
          </li>
          <li>
            <Link href="/pricing1"
              ><i class="ri-price-tag-2-line"></i>Users & Permissions</Link
            >
          </li>
          <li>
            <Link href="/coming-soon"
              ><i class="ri-mastercard-line"></i>Communication</Link
            >
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
            <Link href="/timeline"><i class="ri-pages-line"></i>Users</Link>
          </li>
          <li>
            <Link href="/invoice"
              ><i class="ri-question-answer-line"></i>Roles</Link
            >
          </li>
          <li>
            <Link href="/blank"
              ><i class="ri-invision-line"></i>Permissions</Link
            >
          </li>
        </ul>
      </li>

      <li class="iq-menu-title"><i class=""></i><span>Reports</span></li>

      <li>
        <a
          href="#reports"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-pantone-line"></i><span>Reports</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="reports"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link href="/login"><i class="ri-login-box-line"></i>Sales</Link>
          </li>
          <li>
            <Link href="/register"
              ><i class="ri-login-circle-line"></i>Expenses</Link
            >
          </li>
          <li>
            <Link href="/recover"
              ><i class="ri-record-mail-line"></i>Leads</Link
            >
          </li>
        </ul>
      </li>
      <div class="py-5"></div>
    </ul>
  </nav>
</template>