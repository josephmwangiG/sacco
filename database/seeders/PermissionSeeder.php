<?php

namespace database\seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionSeeder extends Seeder
{

    public function run()
    {
        DB::table('permissions')->Delete();

        $permissions = [
            [
                'name'           => 'Expense-View',
                'display_name'   => 'Expense View',
                'description'    => 'Expense View'
            ],
            [
                'name'           => 'Expense-Add',
                'display_name'   => 'Expense Add',
                'description'    => 'Expense Add'
            ],
            [
                'name'           => 'Expense-Edit',
                'display_name'   => 'Expense Edit',
                'description'    => 'Expense Edit'
            ],
            [
                'name'           => 'Expense-Delete',
                'display_name'   => 'Expense Delete',
                'description'    => 'Expense Delete'
            ],
            [
                'name'           => 'Users-View',
                'display_name'   => 'Users View',
                'description'    => 'Users View'
            ],
            [
                'name'           => 'Users-Add',
                'display_name'   => 'Users Add',
                'description'    => 'Users Add'
            ],
            [
                'name'           => 'Users-Edit',
                'display_name'   => 'Users Edit',
                'description'    => 'Users Edit'
            ],
            [
                'name'           => 'Users-Delete',
                'display_name'   => 'Users Delete',
                'description'    => 'Users Delete'
            ],
            [
                'name'           => 'Roles-View',
                'display_name'   => 'Roles View',
                'description'    => 'Roles View'
            ],
            [
                'name'           => 'Roles-Add',
                'display_name'   => 'Roles Add',
                'description'    => 'Roles Add'
            ],
            [
                'name'           => 'Roles-Edit',
                'display_name'   => 'Roles Edit',
                'description'    => 'Roles Edit'
            ],
            [
                'name'           => 'Roles-Delete',
                'display_name'   => 'Roles Delete',
                'description'    => 'Roles Delete'
            ],
            [
                'name'           => 'Branches-View',
                'display_name'   => 'Branches View',
                'description'    => 'Branches View'
            ],
            [
                'name'           => 'Branches-Add',
                'display_name'   => 'Branches Add',
                'description'    => 'Branches Add'
            ],
            [
                'name'           => 'Branches-Edit',
                'display_name'   => 'Branches Edit',
                'description'    => 'Branches Edit'
            ],
            [
                'name'           => 'Branches-Delete',
                'display_name'   => 'Branches Delete',
                'description'    => 'Branches Delete'
            ],
            [
                'name'           => 'Members-View',
                'display_name'   => 'Members View',
                'description'    => 'Members View'
            ],
            [
                'name'           => 'Members-Add',
                'display_name'   => 'Members Add',
                'description'    => 'Members Add'
            ],
            [
                'name'           => 'Members-Edit',
                'display_name'   => 'Members Edit',
                'description'    => 'Members Edit'
            ],
            [
                'name'           => 'Members-Delete',
                'display_name'   => 'Members Delete',
                'description'    => 'Members Delete'
            ],
            [
                'name'           => 'Leads-View',
                'display_name'   => 'Leads View',
                'description'    => 'Leads View'
            ],
            [
                'name'           => 'Leads-Add',
                'display_name'   => 'Leads Add',
                'description'    => 'Leads Add'
            ],
            [
                'name'           => 'Leads-Edit',
                'display_name'   => 'Leads Edit',
                'description'    => 'Leads Edit'
            ],
            [
                'name'           => 'Leads-Delete',
                'display_name'   => 'Leads Delete',
                'description'    => 'Leads Delete'
            ],
            [
                'name'           => 'Applications-View',
                'display_name'   => 'Applications View',
                'description'    => 'Applications View'
            ],
            [
                'name'           => 'Applications-Add',
                'display_name'   => 'Applications Add',
                'description'    => 'Applications Add'
            ],
            [
                'name'           => 'Applications-Edit',
                'display_name'   => 'Applications Edit',
                'description'    => 'Applications Edit'
            ],
            [
                'name'           => 'Applications-Delete',
                'display_name'   => 'Applications Delete',
                'description'    => 'Applications Delete'
            ],
            [
                'name'           => 'Loans-View',
                'display_name'   => 'Loans View',
                'description'    => 'Loans View'
            ],
            [
                'name'           => 'Loans-Add',
                'display_name'   => 'Loans Add',
                'description'    => 'Loans Add'
            ],
            [
                'name'           => 'Loans-Edit',
                'display_name'   => 'Loans Edit',
                'description'    => 'Loans Edit'
            ],
            [
                'name'           => 'Loans-Delete',
                'display_name'   => 'Loans Delete',
                'description'    => 'Loans Delete'
            ],
            [
                'name'           => 'Deposits-View',
                'display_name'   => 'Deposits View',
                'description'    => 'Deposits View'
            ],
            [
                'name'           => 'Deposits-Add',
                'display_name'   => 'Deposits Add',
                'description'    => 'Deposits Add'
            ],
            [
                'name'           => 'Deposits-Edit',
                'display_name'   => 'Deposits Edit',
                'description'    => 'Deposits Edit'
            ],
            [
                'name'           => 'Deposits-Delete',
                'display_name'   => 'Deposits Delete',
                'description'    => 'Deposits Delete'
            ],
            [
                'name'           => 'LoanTypes-View',
                'display_name'   => 'LoanTypes View',
                'description'    => 'LoanTypes View'
            ],
            [
                'name'           => 'LoanTypes-Add',
                'display_name'   => 'LoanTypes Add',
                'description'    => 'LoanTypes Add'
            ],
            [
                'name'           => 'LoanTypes-Edit',
                'display_name'   => 'LoanTypes Edit',
                'description'    => 'LoanTypes Edit'
            ],
            [
                'name'           => 'LoanTypes-Delete',
                'display_name'   => 'LoanTypes Delete',
                'description'    => 'LoanTypes Delete'
            ],
            [
                'name'           => 'Accounts-View',
                'display_name'   => 'Accounts View',
                'description'    => 'Accounts View'
            ],
            [
                'name'           => 'Accounts-Add',
                'display_name'   => 'Accounts Add',
                'description'    => 'Accounts Add'
            ],
            [
                'name'           => 'Accounts-Edit',
                'display_name'   => 'Accounts Edit',
                'description'    => 'Accounts Edit'
            ],
            [
                'name'           => 'Accounts-Delete',
                'display_name'   => 'Accounts Delete',
                'description'    => 'Accounts Delete'
            ],
            [
                'name'           => 'WitnessTypes-View',
                'display_name'   => 'WitnessTypes View',
                'description'    => 'WitnessTypes View'
            ],
            [
                'name'           => 'WitnessTypes-Add',
                'display_name'   => 'WitnessTypes Add',
                'description'    => 'WitnessTypes Add'
            ],
            [
                'name'           => 'WitnessTypes-Edit',
                'display_name'   => 'WitnessTypes Edit',
                'description'    => 'WitnessTypes Edit'
            ],
            [
                'name'           => 'WitnessTypes-Delete',
                'display_name'   => 'WitnessTypes Delete',
                'description'    => 'WitnessTypes Delete'
            ],
            [
                'name'           => 'LoansSettings-View',
                'display_name'   => 'LoansSettings View',
                'description'    => 'LoansSettings View'
            ],
            [
                'name'           => 'LoansSettings-Add',
                'display_name'   => 'LoansSettings Add',
                'description'    => 'LoansSettings Add'
            ],
            [
                'name'           => 'LoansSettings-Edit',
                'display_name'   => 'LoansSettings Edit',
                'description'    => 'LoansSettings Edit'
            ],
            [
                'name'           => 'LoansSettings-Delete',
                'display_name'   => 'LoansSettings Delete',
                'description'    => 'LoansSettings Delete'
            ],
            [
                'name'           => 'Capital-View',
                'display_name'   => 'Capital View',
                'description'    => 'Capital View'
            ],
            [
                'name'           => 'Capital-Add',
                'display_name'   => 'Capital Add',
                'description'    => 'Capital Add'
            ],
            [
                'name'           => 'Capital-Edit',
                'display_name'   => 'Capital Edit',
                'description'    => 'Capital Edit'
            ],
            [
                'name'           => 'Capital-Delete',
                'display_name'   => 'Capital Delete',
                'description'    => 'Capital Delete'
            ],
            [
                'name'           => 'Reports-View',
                'display_name'   => 'Reports View',
                'description'    => 'Reports View'
            ],
            [
                'name'           => 'Approve-Loans',
                'display_name'   => 'Approve Loans',
                'description'    => 'Approve Loans'
            ],

        ];

        foreach ($permissions as $key => $value) {
            DB::table('permissions')->insert(
                $value
            );
        }
    }
}
