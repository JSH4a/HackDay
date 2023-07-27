from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from HighFiv.auth import login_required
from HighFiv.db import get_db

bp = Blueprint('blog', __name__)


@bp.route('/')
def index():
    return render_template('highFiv/index.html')
