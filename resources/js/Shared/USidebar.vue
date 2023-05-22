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

      <li>
        <a
          href="#profile"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>My Profile</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="profile"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link :href="route('u.details')" preserve-state
              ><i class="ri-stack-line"></i>Personal Information</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>My Accounts</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Change Password</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Reset Pin</Link
            >
          </li>
        </ul>
      </li>
      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Loans and Savings</span>
      </li>
      <li>
        <a
          href="#loans"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>Loans Hub</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="loans"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link :href="route('u.loans')" preserve-state
              ><i class="ri-stack-line"></i>Loans</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Loans Status Trail</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Guarantor Eligibility</Link
            >
          </li>
        </ul>
      </li>
      <li>
        <a
          href="#on_loans"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-database-line"></i><span>Online Loans Hub</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="on_loans"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link :href="route('calculator')" preserve-state
              ><i class="ri-stack-line"></i>Loans Calculator</Link
            >
          </li>
          <li>
            <Link :href="route('u.loanApplications')" preserve-state
              ><i class="ri-checkbox-line"></i>Loan Applications</Link
            >
          </li>
          <li>
            <Link :href="route('loanApplications.index')" preserve-state
              ><i class="ri-checkbox-line"></i>Guarantee Requests</Link
            >
          </li>
        </ul>
      </li>

      <li>
        <Link
          :href="route('members.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-menu-3-line"></i><span>Dividends</span></Link
        >
      </li>

      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Downloads</span>
      </li>
      <li>
        <a
          href="#icons"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-list-check"></i><span>Statements</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="icons"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link :href="route('u.member.statements')" preserve-state
              ><i class="ri-stack-line"></i>Member Statements</Link
            >
          </li>
          <li>
            <Link :href="route('u.savings.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Saving Statements</Link
            >
          </li>
          <li>
            <Link :href="route('u.loans.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loans Statements</Link
            >
          </li>
          <li>
            <Link :href="route('u.guarantors.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loan Guarantors</Link
            >
          </li>
          <li>
            <Link :href="route('u.guarantees.statements')" preserve-state
              ><i class="ri-checkbox-line"></i>Loans Guaranteed</Link
            >
          </li>
        </ul>
      </li>
      <li>
        <a
          href="#extra-pages"
          class="iq-waves-effect collapsed"
          data-toggle="collapse"
          aria-expanded="false"
          ><i class="ri-toggle-line"></i><span>Downloads</span
          ><i class="ri-arrow-right-s-line iq-arrow-right"></i
        ></a>
        <ul
          id="extra-pages"
          class="iq-submenu collapse"
          data-parent="#iq-sidebar-toggle"
        >
          <li>
            <Link :href="'/edit'"
              ><i class="ri-pages-line"></i>Strategic Plan</Link
            >
          </li>
          <li>
            <Link :href="route('accounts.index')"
              ><i class="ri-question-answer-line"></i>Loans Form</Link
            >
          </li>
          <li>
            <a href="#"><i class="ri-invision-line"></i>Membership Forms</a>
          </li>
          <li>
            <Link :href="route('witnessTypes.index')"
              ><i class="ri-archive-line"></i>Agm</Link
            >
          </li>

          <li>
            <Link :href="route('loanSettings')"
              ><i class="ri-error-warning-line"></i>Policies</Link
            >
          </li>
          <li>
            <a href="#"><i class="ri-price-tag-line"></i>Noticies</a>
          </li>
          <li>
            <a href="#"><i class="ri-mastercard-line"></i>Unclaimed Assets</a>
          </li>
        </ul>
      </li>

      <li class="iq-menu-title">
        <i class="ri-subtract-line"></i><span>Help</span>
      </li>
      <li>
        <Link
          :href="route('leads.index')"
          class="iq-waves-effect"
          aria-expanded="false"
          ><i class="ri-checkbox-line"></i><span>Customer Care</span></Link
        >
      </li>

      <div class="py-5"></div>
    </ul>
  </nav>
</template>
