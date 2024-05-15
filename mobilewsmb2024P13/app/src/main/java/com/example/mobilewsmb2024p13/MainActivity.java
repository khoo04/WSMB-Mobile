package com.example.mobilewsmb2024p13;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        ImageView robotic=findViewById(R.id.robotic);
        robotic.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView cloud=findViewById(R.id.cloud);
        cloud.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView cyber=findViewById(R.id.cyber);
        cyber.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView game=findViewById(R.id.game);
        game.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView it=findViewById(R.id.it);
        it.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView mobile=findViewById(R.id.mobile);
        mobile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView network=findViewById(R.id.network);
        network.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
        ImageView web=findViewById(R.id.web);
        web.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(MainActivity.this, event_deteils.class);
                startActivity(intent);
            }
        });
    }
}