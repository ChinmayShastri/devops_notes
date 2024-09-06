# Example for Persistent Volume

- Create a Docker image of Nginx by following these steps:
  - Create your own `index.html` file.
  - Copy the `index.html` file into your Nginx image while building the image.
  - Start the container by mounting the `index.html` file to the corresponding file inside the container.
  - Now access to nginx web page and you will see your own web page defined in `index.html`.
  - Any changes made to the `index.html` file outside the container should be reflected inside the container.
  - If it works, **Congratulations! You have passed the Persistent Volume Test**.

