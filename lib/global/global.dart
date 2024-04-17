// const base_url = 'http://localhost:5454/api/v1';
const base_url = 'https://edmas-server.onrender.com/api/v1';

const register_url = '${base_url}/auth/register';
const login_url = '${base_url}/auth/login';
const fetch_products_url = '${base_url}/product/get-all';
const add_products_url = '${base_url}/product/create';
const all_shelf_url = '${base_url}/shelf/get-all';
const single_product_details_url = '${base_url}/product/get-by-id';
const get_curr_balance = '${base_url}/accounts/get-current-balance';
const add_income_expense_url = '${base_url}/accounts/create';
const get_all_transaction_url = '${base_url}/accounts/get-all-transaction';
const update_product_details_url = '${base_url}/product/update';
const delete_product_url = '${base_url}/product/delete';
const send_application_url = '${base_url}/application/create';
const get_application_by_applicantid_url = '${base_url}/application/get-all';
