import {Switch_Currency} from './actions';

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case Switch_Currency:
      return {
          baseCurrency: action.baseCurrency,
          rates: action.rates
      }
    default:
      return state

  }
};

export default reducer;
