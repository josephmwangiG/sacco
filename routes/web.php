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
use App\Http\Controllers\LoanStatementController;
use App\Http\Controllers\LoanTypeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\StatementsController;
use App\Http\Controllers\SuperAdmin\OrganizationsController;
use App\Http\Controllers\SuperAdmin\SuperAdminController;
use App\Http\Controllers\ToolsController;
use App\Http\Controllers\UACController;
use App\Http\Controllers\UserController;
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

Route::group(["middleware" => ["auth"]], function () {
    Route::get('/calculator', [ToolsController::class, 'calculator'])->name("calculator");
    Route::get('/pdf/members', [PDFController::class, 'members'])->name("pdf.members");
    Route::get('/pdf/leads', [PDFController::class, 'leads'])->name("pdf.leads");
    Route::get('/pdf/deposits', [PDFController::class, 'deposits'])->name("pdf.deposits");
    Route::get('/pdf/withdrawals', [PDFController::class, 'withdrawals'])->name("pdf.withdrawals");
    Route::get('/pdf/loans', [PDFController::class, 'loans'])->name("pdf.loans");
    Route::get('/pdf/loan-applications', [PDFController::class, 'loansApplications'])->name("pdf.loan.applications");
    Route::get('/pdf/downolad-pdf', [PDFController::class, 'downloadPDF'])->name("pdf.download");
});


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
    Route::get('/users', [UACController::class, "getUsers"])->name('get-users');
    Route::get('/roles', [UACController::class, "getRoles"])->name('get-roles');
    Route::post('/roles-add', [UACController::class, "storeRole"])->name('roles.store');
    Route::put('/roles-update/{id}', [UACController::class, "updateRole"])->name('roles.update');
    Route::get('/roles', [UACController::class, "getRoles"])->name('get-roles');
    Route::post('/users-add', [UACController::class, "storeUser"])->name('users.store');
    Route::put('/users-update/{id}', [UACController::class, "updateUser"])->name('users.update');

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
    Route::get('/loanApplications/reject/{loan_id}', [LoanApplicationController::class, 'reject'])->name('loanApplications.reject');


    Route::post('/loanApplications/guarantors/{loan_id}', [LoanApplicationController::class, 'createguarantors'])->name('loanApplications.store.guarantors');
    Route::put('/loanApplications/guarantors/{g_id}', [LoanApplicationController::class, 'updateGuarantors'])->name('loanApplications.update.guarantors');
    Route::put('/loanApplications/witness/{loan_id}', [LoanApplicationController::class, 'updateWitness'])->name('loanApplications.witness.update');
    Route::delete('/loanApplications/guarantors/{g_id}', [LoanApplicationController::class, 'deleteGuarantors'])->name('loanApplications.delete.guarantors');
    Route::put('/loanApplications/disbursement/{loan_id}/save', [LoanApplicationController::class, 'updateDisbursement'])->name('loanApplications.update.disbusement');
    Route::put('/loanApplications/confirm/{loan_id}/save', [LoanApplicationController::class, 'saveConfirm'])->name('loanApplications.confirm.store');
    Route::put('/loanApplications/reject/{loan_id}/save', [LoanApplicationController::class, 'saveReject'])->name('loanApplications.reject.store');

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


Route::group(["middleware" => ["auth", "user"], 'prefix' => "/u"], function () {
    Route::get('/', [DashboardController::class, 'udashboard'])->name('u.index');
    Route::get('/dashboard', [DashboardController::class, 'dashboard'])->name('u.dashboard');

    Route::get('/applications', [LoanApplicationController::class, 'uLoanApplications'])->name('u.loanApplications');
    Route::get('/applications/{loan_id}', [LoanApplicationController::class, 'uEdit'])->name('u.loanApplications.edit');
    Route::get('/loanApplications/witness/{loan_id}', [LoanApplicationController::class, 'uWitness'])->name('u.loanApplications.witness');
    Route::get('/loanApplications/guarantors/{loan_id}', [LoanApplicationController::class, 'uGuarantors'])->name('u.loanApplications.guarantors');
    Route::get('/loanApplications/collaterals/{loan_id}', [LoanApplicationController::class, 'uCollaterals'])->name('u.loanApplications.collaterals');
    Route::get('/loanApplications/disbursement/{loan_id}', [LoanApplicationController::class, 'uDisbursement'])->name('u.loanApplications.disbursement');
    Route::get('/loanApplications/confirm/{loan_id}', [LoanApplicationController::class, 'uConfirm'])->name('u.loanApplications.confirm');
    Route::get('/loanApplications/reject/{loan_id}', [LoanApplicationController::class, 'uReject'])->name('u.loanApplications.reject');

    Route::post('/loanApplications', [LoanApplicationController::class, 'store'])->name('u.loanApplications.store');
    Route::post('/loanApplications/{id}', [LoanApplicationController::class, 'update'])->name('u.loanApplications.update');

    Route::get('/loans', [LoansController::class, 'uLoans'])->name('u.loans');
    Route::get('/loans/{loan_id}', [LoansController::class, 'uViewLoan'])->name('u.view.loan');
    Route::get('/activeLoans/payments/{loan_id}', [LoansController::class, 'uPayments'])->name('u.activeLoans.payments');
    Route::get('/activeLoans/accrue/{loan_id}', [LoansController::class, 'uAccrue'])->name('u.activeLoans.accrue');
    Route::get('/activeLoans/penalties/{loan_id}', [LoansController::class, 'uPenalties'])->name('u.activeLoans.penalties');
    Route::get('/activeLoans/collateral/{loan_id}', [LoansController::class, 'uCollateral'])->name('u.activeLoans.collateral');
    Route::get('/activeLoans/guarantors/{loan_id}', [LoansController::class, 'uGuarantors'])->name('u.activeLoans.guarantors');

    // Member Statements 
    Route::get("/statements/member", [StatementsController::class, 'statements'])->name('u.member.statements');
    Route::get("/statements/loans", [StatementsController::class, 'loans'])->name('u.loans.statements');
    Route::get("/statements/savings", [StatementsController::class, 'savings'])->name('u.savings.statements');
    Route::get("/statements/guarantors", [StatementsController::class, 'guarantors'])->name('u.guarantors.statements');
    Route::get("/statements/guarantees", [StatementsController::class, 'guarantees'])->name('u.guarantees.statements');


    Route::get("/statements/member/pdf", [StatementsController::class, 'statementsPdf'])->name('u.member.statements.pdf');
    Route::get("/statements/loans/pdf", [StatementsController::class, 'loansPdf'])->name('u.loans.statements.pdf');
    Route::get("/statements/savings/pdf", [StatementsController::class, 'savingsPdf'])->name('u.savings.statements.pdf');
    Route::get("/statements/guarantors/pdf", [StatementsController::class, 'guarantorsPdf'])->name('u.guarantors.statements.pdf');
    Route::get("/statements/guarantees/pdf", [StatementsController::class, 'guarateedPdf'])->name('u.guarantees.statements.pdf');
    Route::resource("/statements", LoanStatementController::class);


    Route::get('/details', [MemberController::class, 'uDetails'])->name('u.details');
});
