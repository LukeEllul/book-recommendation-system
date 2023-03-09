# Use the official Miniconda3 image as the base image
FROM continuumio/miniconda3

# Set the working directory
WORKDIR /app

# Copy the environment.yml file to the working directory
COPY environment.yml .

COPY data data
COPY notebooks notebooks

# Create a new conda environment and install the dependencies
RUN conda env create -f environment.yml

# Activate the new environment
SHELL ["conda", "run", "-n", "book_recommender_env", "/bin/bash", "-c"]

# Expose the port for Jupyter notebook
EXPOSE 8888

# Start Jupyter notebook
CMD ["conda", "run", "-n", "book_recommender_env", "jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]