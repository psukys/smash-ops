FROM python:3

LABEL Author="Paulius Sukys <paul.sukys@gmail.com>"

WORKDIR /opt/smash
EXPOSE 8000

# Prepare app
RUN apt-get update
RUN apt-get install -y git python3-psycopg2
RUN git clone https://github.com/nukeop/smash.git .
RUN pip install -r requirements.txt
RUN pip install gunicorn

# Clean-up git artifacts
RUN rm -rf .git

# Health check
RUN apt-get install -y curl
HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1

CMD ["gunicorn", "run:app", "-b", "0.0.0.0:8000"]