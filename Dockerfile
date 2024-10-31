FROM python:3.9

COPY . .

CMD ["python3", "-m", "unittest", "ExperimentTest.py"]