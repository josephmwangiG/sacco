<?php

/**
 * Created by PhpStorm.
 * User: kevin
 * Email: robisignals@gmail.com
 * Date: 03/06/2019
 * Time: 10:49
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Organization extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'organizations';


    protected $fillable = [
        'business_name',
        'business_type',
        'email',
        'currency',
        'phone',
        'alternate_phone',
        'country',
        'county',
        'city',
        'about',
        'physical_address',
        'postal_address',
        'postal_code',
        'logo',
        'favicon',
        'date_format',
        'amount_thousand_separator',
        'amount_decimal_separator',
        'amount_decimal'
    ];
}
