from subprocess import Popen, PIPE
from flask import Flask, render_template, request

app = Flask(__name__)
_ERROR_MESS = 'Internal server error!'


def command_output(cmd):
    try:
        proc = Popen(cmd, stdout=PIPE, stderr=PIPE)

        std_out, std_err = proc.communicate()
        std_out = ''.join(std_out)
        exit_code = proc.poll()

        if exit_code != 0:
            print std_err
	    return _ERROR_MESS

    except (OSError, EnvironmentError) as e:
        print e
        return _ERROR_MESS

    return std_out


@app.route('/', methods=['GET', 'POST'])
def form():
    return render_template('main.html')


@app.route('/result', methods=['GET', 'POST'])
def result():
    input_data = request.form['psas_input']
    response = command_output(['./cli-handler', input_data])
    return render_template('response.html', result=response)


def create_app():
    return app


if __name__ == "__main__":
    app.run()