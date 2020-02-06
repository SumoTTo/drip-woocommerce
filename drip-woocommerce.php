<?php
/**
 * Plugin Name: Drip WooCommerce
 *
 * @package Drip_Woocommerce
 */

defined( 'ABSPATH' ) || die( 'Executing outside of the WordPress context.' );

if ( in_array( 'woocommerce/woocommerce.php', apply_filters( 'active_plugins', get_option( 'active_plugins' ) ), true ) ) {
    require_once __DIR__ . '/src/class-drip-woocommerce-cart-events.php';
    include(__DIR__ . '/src/class-drip-woocommerce-settings.php');

    (new Drip_Woocommerce_Cart_Events())->setup_cart_actions();
}
