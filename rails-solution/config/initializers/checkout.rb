# Here we apply the logic created inside app/lib folter
# Load initial pricing rules to be accessible for every class of this project
# You can edit this rules, if do you must have to restart the server
# You can try adding some new rules for the MUG product

# current rules
PRICING_RULES = [
  {
    product_code: "VOUCHER",
    formula: "(count / 2.to_f).ceil * price"
  },
  {
    product_code: "TSHIRT",
    formula: "count >= 3 ? count * 19.0 : count * price "
  }
]
