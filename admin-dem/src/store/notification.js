export const notification = {
  namespaced: true,
  state: {
      visibility: false,
      message: null,
      timeout: 0,
      color: null
  },
  mutations: {
    show(state, payload) {
      state.message = payload.message;
      state.timeout = payload.timeout;
      state.color = payload.color;
      state.visibility = true;
    },
    hide(state) {
      state.visibility = false;
    }
  },
  actions: {
    show({ commit }, payload) {
      commit('show', payload)
    },
    hide({ commit }) {
      commit('hide');
    }
  }
}