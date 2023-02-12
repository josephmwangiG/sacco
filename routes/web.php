<?php

use App\Http\Controllers\AccountsController;
use App\Http\Controllers\ApplicationAssetsController;
use App\Http\Controllers\AssetController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\GeneralSettingController;
use App\Http\Controllers\LeadsController;
use App\Http\Controllers\LoanApplicationController;
use App\Http\Controllers\LoansController;
use App\Http\Controllers\LoanTypeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\SuperAdmin\OrganizationsController;
use App\Http\Controllers\SuperAdmin\SuperAdminController;
use App\Http\Controllers\WithdrawalController;
use App\Http\Controllers\WitnessController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Auth
Route::get('/login', [LoginController::class, 'login'])->name('login');
Route::post('/authenticate', [LoginController::class, 'authenticate'])->name('authenticate');
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

// Super Admin
Route::group(["middleware" => ['auth', "superadmin"]], function () {
    Route::get('/s-admin/dashboard', [SuperAdminController::class, 'dashboard'])->name('super.admin');
    Route::resource('/s-admin/organizations', OrganizationsController::class);
});

Route::group(['middleware' => ["auth", "admin"]], function () {
    Route::get('/', [DashboardController::class, 'dashboard'])->name('index');
    Route::get('/home', [DashboardController::class, 'dashboard'])->name('home');
    Route::get('/organization', [GeneralSettingController::class, 'index'])->name("organization");
    Route::get('/edit', [GeneralSettingController::class, 'edit'])->name("organization.edit");
    Route::post('/change-pass', [GeneralSettingController::class, 'changePassword'])->name("change.password");
    Route::get('/dashboard', [DashboardController::class, 'dashboard'])->name('dashboard');
    Route::resource('/branches', BranchController::class);
    Route::resource('/leads', LeadsController::class);
    Route::resource('/members', MemberController::class);
    Route::resource('/assets', AssetController::class);

    Route::get('/members/assets/{m_id}', [MemberController::class, 'assets'])->name('members.assets');
    Route::get('/members/deposits/{m_id}', [MemberController::class, 'deposits'])->name('members.deposits');
    Route::get('/members/withdrawals/{m_id}', [MemberController::class, 'withdrawals'])->name('members.withdrawals');
    Route::get('/members/loans/{m_id}', [MemberController::class, 'loans'])->name('members.loans');
    Route::get('/members/applications/{m_id}', [MemberController::class, 'applications'])->name('members.applications');
    // Route::get('/members/loans/{m_id}', [MemberController::class, 'loans'])->name('members.loans');

    Route::resource('/accounts', AccountsController::class);
    Route::resource('/deposits', DepositController::class);
    Route::resource('/withdrawals', WithdrawalController::class);
    Route::resource('/loanTypes', LoanTypeController::class);
    Route::resource('/witnessTypes', WitnessController::class);
    Route::get('/loanSettings', [LoanTypeController::class, 'loanSettings'])->name('loanSettings');
    Route::resource('/loanApplications', LoanApplicationController::class);
    Route::resource('/collaterals', ApplicationAssetsController::class);

    Route::get('/loanApplications/witness/{loan_id}', [LoanApplicationController::class, 'witness'])->name('loanApplications.witness');
    Route::get('/loanApplications/guarantors/{loan_id}', [LoanApplicationController::class, 'guarantors'])->name('loanApplications.guarantors');
    Route::get('/loanApplications/collaterals/{loan_id}', [LoanApplicationController::class, 'collaterals'])->name('loanApplications.collaterals');
    Route::get('/loanApplications/disbursement/{loan_id}', [LoanApplicationController::class, 'disbursement'])->name('loanApplications.disbursement');
    Route::get('/loanApplications/confirm/{loan_id}', [LoanApplicationController::class, 'confirm'])->name('loanApplications.confirm');


    Route::post('/loanApplications/guarantors/{loan_id}', [LoanApplicationController::class, 'createguarantors'])->name('loanApplications.store.guarantors');
    Route::put('/loanApplications/guarantors/{g_id}', [LoanApplicationController::class, 'updateGuarantors'])->name('loanApplications.update.guarantors');
    Route::put('/loanApplications/witness/{loan_id}', [LoanApplicationController::class, 'updateWitness'])->name('loanApplications.witness.update');
    Route::delete('/loanApplications/guarantors/{g_id}', [LoanApplicationController::class, 'deleteGuarantors'])->name('loanApplications.delete.guarantors');
    Route::put('/loanApplications/disbursement/{loan_id}/save', [LoanApplicationController::class, 'updateDisbursement'])->name('loanApplications.update.disbusement');
    Route::put('/loanApplications/confirm/{loan_id}/save', [LoanApplicationController::class, 'saveConfirm'])->name('loanApplications.confirm.store');

    Route::resource('/activeLoans', LoansController::class);
    Route::get('/activeLoans/payments/{loan_id}', [LoansController::class, 'payments'])->name('activeLoans.payments');
    Route::get('/activeLoans/accrue/{loan_id}', [LoansController::class, 'accrue'])->name('activeLoans.accrue');
    Route::get('/activeLoans/penalties/{loan_id}', [LoansController::class, 'penalties'])->name('activeLoans.penalties');
    Route::get('/activeLoans/collateral/{loan_id}', [LoansController::class, 'collateral'])->name('activeLoans.collateral');
    Route::get('/activeLoans/guarantors/{loan_id}', [LoansController::class, 'guarantors'])->name('activeLoans.guarantors');


    Route::post('/activeLoans/payments/{loan_id}', [LoansController::class, 'createPayments'])->name('activeLoans.store.payments');
    Route::put('/activeLoans/payments/{p_id}', [LoansController::class, 'updatePayments'])->name('activeLoans.update.payments');
    Route::delete('/activeLoans/payments/{p_id}', [LoansController::class, 'deletePayments'])->name('activeLoans.delete.payments');
});
