<?php

/**
 * Created by PhpStorm.
 * User: kevin
 * Email: robisignals@gmail.com
 * Date: 11/10/2019
 * Time: 23:17
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;



class Report extends Model
{


    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'report_types';

    /**
     * Main table primary key
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'display_name',
        'description'
    ];

    /**
     * Searchable rules.
     *
     * @var array
     */
    protected $searchable = [
        /**
         * Columns and their priority in search results.
         * Columns with higher values are more important.
         * Columns with equal values have equal importance.
         *
         * @var array
         */
        'columns' => [
            'report_types.name' => 2,
            'report_types.display_name' => 1,
            'report_types.description' => 0,
        ]
    ];
}
