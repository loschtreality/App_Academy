export const Switch_Currency = "SWITCH_CURRENCY"

const selectCurrency = (baseCurrency, rates) => {
  return {
    type: Switch_Currency,
    baseCurrency,
    rates
  }
}

export default selectCurrency;
