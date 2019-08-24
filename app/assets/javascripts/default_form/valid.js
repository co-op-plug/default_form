// depend on semantic-ui

HTMLElement.prototype.defaultFormValid = function() {
  let self = $(this);
  let label;
  let locale = document.querySelector('html').lang;
  const xx = {
    zh: {
      badInput: '格式不正确：',
      customError: '输入错误',
      patternMismatch: '非法的',
      rangeOverflow: '输入错误',
      rangeUnderflow: '输入错误',
      stepMismatch: '输入错误',
      tooLong: '太长了',
      tooShort: '太短了',
      typeMismatch: '输入错误',
      valid: '非法值',
      valueMissing: '请输入'
    },
    en: {
      badInput: 'Bad Input:',
      customError: 'Custom Error:',
      patternMismatch: 'Invalid Input: ',
      rangeOverflow: 'Range Over Flow:',
      rangeUnderflow: 'Range Under Flow:',
      stepMismatch: 'Step Mismatch',
      tooLong: 'Too long',
      tooShort: 'Too Short',
      typeMismatch: 'Type Mismatch',
      valid: 'Not valid',
      valueMissing: 'Please enter:'
    }
  };

  for (let key in this.validity) {
    if (this.validity[key]) {
      w = xx[locale][key]
    }
  }

  if (this.labels.length >0) {
    label = this.labels[0].innerText;
  } else {
    label = this.dataset['label'];
  }

  text = w + label;

  self.parent().addClass('error');
  self.parent().popup({
    position: 'right center',
    className: {
      popup: 'ui inverted popup'
    },
    content: text
  }).popup('show');
};

HTMLElement.prototype.defaultFormClear = function() {
  let self = $(this);
  self.parent().removeClass('error');
  self.parent().popup('destroy');
};


